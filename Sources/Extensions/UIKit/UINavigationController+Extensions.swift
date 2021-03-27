//
//  UINavigationController+Extensions.swift
//  Fusion
//
//  Created by Ben Shutt on 18/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {

    /// # Context
    /// If a `UIViewController` is being pushed on the navigation controller stack and we
    /// do not want the tab bar at the bottom of the screen we set
    /// `hidesBottomBarWhenPushed = true`.
    ///
    /// # Issue
    /// Given a `UINavigationController`, in a `UITabBarController`,  with a
    /// viewController stack like:
    /// - `rootViewController`
    /// - `viewController1`
    /// - `viewController2`
    /// where want the tab bar hidden for both `viewController1` and `viewController2` but not
    /// on the `rootViewController`.
    /// Then the correct implementation would be to set `hidesBottomBarWhenPushed = true`
    /// on and before pushing `viewController1`. We don't need to set it also
    /// for `viewController2`.
    ///
    /// If we also set `hidesBottomBarWhenPushed = true` for `viewController2` then
    /// calling `popToRootViewController` from `viewController2` would pop back
    /// to `rootViewController` but the tab bar would still be hidden.
    ///
    /// # Solution
    /// Before pushing a `UIViewController` which wants the tab bar hidden, set
    /// `hidesBottomBarWhenPushed` to the `return` of this.
    /// This function checks to see if there is another `UIViewController` in the navigation
    /// controller stack (before the to be pushed) which has `hidesBottomBarWhenPushed = true`
    func shouldHideBottomBarWhenPushed() -> Bool {
        return !viewControllers.contains { $0.hidesBottomBarWhenPushed }
    }
}
