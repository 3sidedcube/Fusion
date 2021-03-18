//
//  BaseViewController.swift
//  Fusion
//
//  Created by Ben Shutt on 05/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

/// Base `UIViewController` to define default functionality.
/// 
/// Ideally any `UIViewController` in the app should inherit this or `BaseTableViewController`
open class BaseViewController: UIViewController, ActionHandler {

    // MARK: - Init

    public convenience init() {
        self.init(nibName: nil, bundle: nil)
    }

    override public init(
        nibName nibNameOrNil: String?,
        bundle nibBundleOrNil: Bundle?
    ) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
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
        view.backgroundColor = .white
    }

    // MARK: - ActionHandler

    /// Push the `action` on the `navigationController`
    ///
    /// - Parameter action: `Action`
    @discardableResult
    open func handleAction(_ action: Action) -> Bool {
        return navigationController?.pushAction(action) ?? false
    }
}
