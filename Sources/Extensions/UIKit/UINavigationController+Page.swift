//
//  UINavigationController+Page.swift
//  Fusion
//
//  Created by Ben Shutt on 27/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

public extension UINavigationController {

    /// `pushPage(_:animated:)` with the given `pageURL`
    ///
    /// - Parameters:
    ///   - pageURL: `pageURL`
    ///   - animated: `Bool`
    func pushPageURL(_ pageURL: URL, animated: Bool = true) {
        pushPage(.pageURL(pageURL), animated: animated)
    }

    /// `pushPage(_:animated:)` with the given `page`
    ///
    /// - Parameters:
    ///   - page: `page`
    ///   - animated: `Bool`
    func pushPage(_ page: Page, animated: Bool = true) {
        pushPage(.page(page), animated: animated)
    }

    /// Push a `PageViewController` on this `UINavigationController` stack with the
    /// given `configuration`
    ///
    /// - Parameters:
    ///   - configuration: `PageViewController.Configuration`
    ///   - animated: `Bool`
    func pushPage(
        _ configuration: PageViewController.Configuration,
        animated: Bool = true
    ) {
        let viewController = Fusion.shared
            .createPageViewController(configuration: configuration)

        // Pushing should hide the bottom tab bar
        viewController.hidesBottomBarWhenPushed = shouldHideBottomBarWhenPushed()

        // Push on the this `UINavigationController` stack
        pushViewController(viewController, animated: animated)
    }
}
