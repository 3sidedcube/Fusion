//
//  UIViewController+Extensions.swift
//  CBIT
//
//  Created by Ben Shutt on 19/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    // MARK: - ChildViewControllers

    /// Add a child `UIViewController` and set it's `view`s `frame` to its `parent`s `bounds`.
    /// - Parameters:
    ///   - viewController: Child `UIViewController` to add
    ///   - view: `UIView` to add child `viewController` to
    ///   - setFrameAndAutoresizingMask: Set `viewController` frame to `view`s
    ///     `bounds` with `.flexibleWidth, .flexibleHeight` autoresizing mask
    func add(
        child viewController: UIViewController,
        toView view: UIView,
        setFrameAndAutoresizingMask: Bool = true
    ) {
        viewController.willMove(toParent: self)
        addChild(viewController)
        view.addSubview(viewController.view)

        if setFrameAndAutoresizingMask {
            viewController.view.frame = view.bounds
            viewController.view.autoresizingMask = [
                .flexibleWidth, .flexibleHeight
            ]
        }

        viewController.didMove(toParent: self)
    }

    /// Remove a child `UIViewController` from it's parent.
    ///
    /// - Note:
    /// The name `removeFromParent` is already taken
    ///
    /// - Parameter animated: Animate the removal of `self` from `parent`
    func removeFromParentViewController(animated: Bool) {
        let duration = animated ? 0.25 : 0
        UIView.animate(withDuration: duration, animations: {
            self.view.alpha = 0
        }, completion: { _ in
            self.removeFromParentViewController()
            self.view.alpha = 1
        })
    }

    /// Remove from `parent` `UIViewController`
    func removeFromParentViewController() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
        didMove(toParent: nil)
    }
}
