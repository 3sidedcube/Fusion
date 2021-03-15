//
//  BaseTableViewController.swift
//  Fusion
//
//  Created by Ben Shutt on 23/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit
import ThunderTable

/// Base `TableViewController` to define default functionality and handle `protocol`s which
/// the `Row` might conform to and expect a handler.
/// E.g. `ActionHandler` to handle `Action`s invoked from a `Row`
///
/// Ideally, any `UIViewController` in the app should inherit this or `BaseViewController`
open class BaseTableViewController: TableViewController,
    RowUpdateListener, ActionHandler {

    /// Catch `didSet` of `data` setting `self` as their `ActionHandler`
    override open var data: [ThunderTable.Section] {
        didSet {
            configure(data: data)
        }
    }

    // MARK: - Init

    public convenience init() {
        self.init(style: .grouped)
    }

    override public init(style: UITableView.Style) {
        super.init(style: style)
        setup()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    /// Shared initializer functionality
    open func setup() {
        // Subclasses can override
    }

    // MARK: - ViewController lifecycle

    override open func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.tableHeaderView = UIView(frame: CGRect(
            x: 0, y: 0, width: 0, height: CGFloat.leastNormalMagnitude
        ))
        tableView.tableFooterView = UIView(frame: CGRect(
            x: 0, y: 0, width: 0, height: CGFloat.leastNormalMagnitude
        ))
    }

    // MARK: - Redraw

    /// Define a redraw interface
    open func redraw() {
        // Subclasses can override
    }

    /// Handle the given `data` before it's set on `self.data`
    ///
    /// - Parameter data: `[ThunderTable.Section]`
    open func configure(data: [ThunderTable.Section]) {
        data.flatMap { $0.rows }
            .compactMap { $0 as? RowActionable }
            .forEach { $0.actionHandler = self }
    }

    // MARK: - UITableViewDelegate

    override open func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        guard let row = self[indexPath]?.row as? CellHeightConfigurable else {
            return super.tableView(tableView, heightForRowAt: indexPath)
        }

        return row.heightForRowInTableViewController(self, forRowAt: indexPath)
    }

    override open func tableView(
        _ tableView: UITableView,
        willDisplay cell: UITableViewCell,
        forRowAt indexPath: IndexPath
    ) {
        // super not implemented

        // `CellDisplayable` of the cell
        if let tableCell = cell as? CellDisplayable {
            tableCell.willDisplayCell(cell, in: self, forRowAt: indexPath)
        }

        // `CellDisplayable` of the row
        if let row = self[indexPath]?.row as? CellDisplayable {
            row.willDisplayCell(cell, in: self, forRowAt: indexPath)
        }
    }

    // MARK: - RefreshControl

    /// Set `refreshControl` to a new instance of `UIRefreshControl`
    ///
    /// - Parameters:
    ///   - target: `Any` `.valueChanged` target
    ///   - action: `Selector` `.valueChanged` selector
    ///   - tintColor: `UIColor` to set on `UIRefreshControl`, fallback on `view.tintColor`
    open func addRefreshControl(
        target: Any,
        action: Selector,
        tintColor: UIColor? = nil
    ) {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = tintColor ?? view.tintColor
        refreshControl.addTarget(target, action: action, for: .valueChanged)
        self.refreshControl = refreshControl
    }

    /// Set `refreshControl` to `nil`
    open func removeRefreshControl() {
        refreshControl?.endRefreshing()
        refreshControl = nil
    }

    /// `beginRefreshing` on `refreshControl` if not already
    open func beginRefreshing() {
        guard let refreshControl = refreshControl else { return }
        guard !refreshControl.isRefreshing else { return }
        refreshControl.beginRefreshing()
    }

    /// `endRefreshing` on `refreshControl` if not already
    open func endRefreshing() {
        DispatchQueue.main.async { // Push back of main queue to prevent glitch
            guard let refreshControl = self.refreshControl else { return }
            guard refreshControl.isRefreshing else { return }
            refreshControl.endRefreshing()
        }
    }

    /// Set `refreshing` state
    ///
    /// - Parameter refreshing: `Bool`
    open func setRefreshing(_ refreshing: Bool) {
        if refreshing {
            beginRefreshing()
        } else {
            endRefreshing()
        }
    }

    // MARK: - TableView

    /// Execute `closure` wrapped in a call to `beginUpdates()` and `endUpdates()`
    /// on `tableView`
    ///
    /// - Parameter closure: Closure to execute updates
    open func performUpdates(closure: (UITableView) -> Void = { _ in }) {
        guard let tableView = tableView else { return }
        tableView.beginUpdates()
        closure(tableView)
        tableView.endUpdates()
    }

    // MARK: - RowUpdateListener

    /// `row` requested `tableView` updates
    ///
    /// - Parameter row: `Row`
    open func rowRequestedUpdate(_ row: Row) {
        performUpdates()
    }

    // MARK: - ActionHandler

    /// Push the `action` on the `navigationController`
    ///
    /// - Parameter action: `Action`
    @discardableResult
    public func handleAction(_ action: Action) -> Bool {
        return navigationController?.pushAction(action) ?? false
    }
}
