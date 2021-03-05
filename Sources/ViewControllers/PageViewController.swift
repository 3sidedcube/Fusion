//
//  TableTemplateViewController.swift
//  CBIT
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
open class PageViewController: UIViewController {

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

    /// Container `UIView` for other content.
    ///
    /// Commonly used by subclasses to insert a child `UIViewController`.
    private(set) lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()

    /// `UIActivityIndicatorView` visible when refreshing
    private lazy var activityIndicator: UIActivityIndicatorView = {
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

    // MARK: - Init

    /// Initialize with `page`
    ///
    /// - Parameters:
    ///   - page: `Page`
    convenience init(page: Page) {
        self.init(configuration: .page(page))
    }

    /// Initialize with `pageURL`
    ///
    /// - Parameters:
    ///   - pageURL: `URL`
    convenience init(pageURL: URL) {
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

        // Add `contentView` subview
        view.addSubview(contentView)
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        // `tableView`
        tableView.backgroundColor = view.backgroundColor
        tableView.alwaysBounceVertical = false
        tableView.alwaysBounceHorizontal = false

        // `activityIndicator`
        contentView.addSubview(activityIndicator)

        // Redraw the UI
        redraw()

        // Load the `Page`
        refresh()
    }

    override open func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        contentView.frame = view.bounds
        activityIndicator.center = contentView.center
    }

    // MARK: - Redraw

    /// Redraw UI
    open func redraw() {
        title = page?.title
        tableViewController.data = page?.data ?? []
    }

    // MARK: - Refresh

    /// Start animating `activityIndicator` unless the `tableViewController` defines
    /// a `UIRefreshControl`
    func beginRefreshing() {
        tableViewController.beginRefreshing()
        if tableViewController.refreshControl == nil {
            activityIndicator.startAnimating()
        }
    }

    /// Stop animating `activityIndicator`
    func endRefreshing() {
        tableViewController.endRefreshing()
        activityIndicator.stopAnimating()
    }

    /// Load the `Page` from the API if the `Page` can be fetched from a `URL`
    func refresh() {
        guard
            case .pageURL(let pageURL) = configuration,
            let httpRequest = try? Fusion.shared.pageHttpRequest(for: pageURL)
        else {
            return
        }

        beginRefreshing()
        AF.request(httpRequest) { [weak self] result in
            self?.endRefreshing()
            self?.page = result.cmsObjectModel()
        }
    }
}
