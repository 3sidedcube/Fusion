//
//  TableTemplateViewController.swift
//  Fusion
//
//  Created by Ben Shutt on 20/01/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit
import ThunderTable
import HTTPRequest
import Alamofire

/// A `TemplateViewController` where a `TableViewController` child `UIViewController`
/// is embedded in `contentView`.
///
/// - Warning:
/// This class is abstract as it requires subclasses to provide an instance of `T` where `T` is a
/// `BaseTableViewController` subclass
open class PageViewController: BaseViewController {

    /// Provide a `page` if known, otherwise the means of which to fetch it
    public enum Configuration {

        /// `Page` model to drive UI
        case page(Page)

        /// `URL` to fetch the `Page` model.
        case pageURL(URL)
    }

    /// `Configuration` this `PageViewController` is initialized with
    public let configuration: Configuration

    /// `Page` model loaded from the API
    open var page: Page? {
        didSet {
            redraw()
        }
    }

    /// `UIView` to contain child `UITableViewController`
    public private(set) lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()

    /// `UIActivityIndicatorView` visible when refreshing
    public private(set) lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = view.tintColor
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
        return activityIndicator
    }()

    /// The `TableViewController` instance
    open private(set) lazy var tableViewController = BaseTableViewController()

    /// `tableView` of `tableViewController`
    public var tableView: UITableView! {
        return tableViewController.tableView
    }

    /// Refresh the `Page` on pull
    public var pullToRefresh = false {
        didSet {
            didSetPullToRefresh()
        }
    }

    /// Is the `Page` currently being refreshed
    public private(set) var isRefreshing = false

    // MARK: - Init

    /// Initialize with `page`
    ///
    /// - Parameters:
    ///   - page: `Page`
    public convenience init(page: Page) {
        self.init(configuration: .page(page))
    }

    /// Initialize with `pageURL`
    ///
    /// - Parameters:
    ///   - pageURL: `URL`
    public convenience init(pageURL: URL) {
        self.init(configuration: .pageURL(pageURL))
    }

    /// Initialize with `configuration`
    ///
    /// - Parameters:
    ///   - configuration: `Configuration`
    private init(configuration: Configuration) {
        self.configuration = configuration
        if case .page(let page) = configuration {
            self.page = page
        }
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - ViewController lifecycle

    override open func viewDidLoad() {
        super.viewDidLoad()

        // Configure `view`
        view.backgroundColor = .white

        // `tableView`
        tableView.alwaysBounceVertical = false
        tableView.alwaysBounceHorizontal = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50

        // Add subviews and constrain
        addSubviews()
        addConstraints()

        // Fire `didSet` of `pullToRefresh`
        didSetPullToRefresh()

        // Redraw the UI
        redraw()

        // Load the `Page`
        refresh()
    }

    // MARK: - Subviews + Constraints

    /// Add subviews to the subview hierarchy
    open func addSubviews() {
        contentView.addSubview(activityIndicator)
        view.addSubview(contentView)

        // Add `tableViewController` as child in `contentView`
        add(
            child: tableViewController,
            toView: contentView,
            setFrameAndAutoresizingMask: true
        )
    }

    /// Add constraints to subviews in the subview hierarchy
    open func addConstraints() {
        contentView.edgeConstraints(to: view)
        activityIndicator.centerConstraints(to: contentView)
    }

    // MARK: - Redraw

    /// Redraw UI
    open func redraw() {
        guard isViewLoaded else { return }

        title = page?.title
        tableViewController.data = page?.data ?? []
    }

    // MARK: - Refresh

    /// `pullToRefresh` set
    private func didSetPullToRefresh() {
        guard isViewLoaded else { return }

        tableViewController.removeRefreshControl()
        guard pullToRefresh else { return }
        tableViewController.addRefreshControl(
            target: self,
            action: #selector(refresh),
            tintColor: view.tintColor
        )
    }

    /// Start animating `activityIndicator` unless the `tableViewController` defines
    /// a `UIRefreshControl`
    private func beginRefreshing() {
        isRefreshing = true
        tableViewController.beginRefreshing()
        if tableViewController.refreshControl == nil {
            activityIndicator.startAnimating()
        }
    }

    /// Stop animating `activityIndicator`
    private func endRefreshing() {
        isRefreshing = false
        tableViewController.endRefreshing()
        activityIndicator.stopAnimating()
    }

    /// Load the `Page` from the API if the `Page` can be fetched from a `URL`
    @objc
    private func refresh() {
        guard
            case .pageURL(let pageURL) = configuration,
            let httpRequest = httpRequestForPageURLOrLog(pageURL)
        else {
            return
        }

        // Check if we are already refreshing
        guard !isRefreshing else { return }

        // Hit API to fetch `Page`
        beginRefreshing()
        AF.request(httpRequest) { [weak self] result in
            self?.endRefreshing()
            self?.page = try? result.cmsObjectOrThrow().data
        }
    }

    // MARK: - HTTPRequest

    /// Create a `HTTPRequest` from the given `pageURL` to fetch a `Page`.
    /// On `throw` log the `Error`.
    ///
    /// - Parameter pageURL: `HTTPRequest`
    private func httpRequestForPageURLOrLog(_ pageURL: URL) -> HTTPRequest? {
        do {
            return try Fusion.shared.httpRequestForPageURL(pageURL)
        } catch {
            let message = "Failed to create \(HTTPRequest.self) for page %@"
            Fusion.shared.log(type: .error, message: message)
            return nil
        }
    }
}
