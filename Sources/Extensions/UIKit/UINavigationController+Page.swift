//
//  UINavigationController+Page.swift
//  Fusion
//
//  Created by Ben Shutt on 27/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

public extension UINavigationController {

    /// `pushPage(_:animated:)` with the given `pageURL`
    ///
    /// - Parameters:
    ///   - pageURL: `pageURL`
    ///   - animated: `Bool`
    func pushPageURL(_ pageURL: URL, animated: Bool = true) {
        pushPage(.source(pageURL), animated: animated)
    }

    /// `pushPage(_:animated:)` with the given `page`
    ///
    /// - Parameters:
    ///   - page: `page`
    ///   - animated: `Bool`
    func pushPage(_ page: Page, animated: Bool = true) {
        pushPage(.model(page), animated: animated)
    }

    /// Push a `PageViewController` on this `UINavigationController` stack with the
    /// given `configuration`
    ///
    /// - Parameters:
    ///   - state: `ModelSource<URL, Page>`
    ///   - animated: `Bool`
    func pushPage(
        _ state: ModelSource<URL, Page>,
        animated: Bool = true
    ) {
        let viewController = Fusion.shared
            .createPageViewController(state: state)

        // Pushing should hide the bottom tab bar
        viewController.hidesBottomBarWhenPushed = shouldHideBottomBarWhenPushed()

        // Push on the this `UINavigationController` stack
        pushViewController(viewController, animated: animated)
    }
}

public extension UINavigationController {

    func push() {
        UIHostingController(rootView: Page)
    }
}
