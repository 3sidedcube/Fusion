//
//  UINavigationController+Action.swift
//  CBIT
//
//  Created by Ben Shutt on 07/01/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

extension UINavigationController {

    // MARK: - Action

    /// Push an `ActionJSON`
    ///
    /// - Parameters:
    ///   - actionJSON: `ActionJSON` to push
    @discardableResult
    func pushActionJSON(_ actionJSON: ActionJSON) -> Bool {
        guard let action = try? actionJSON.toAction() else { return false }
        return pushAction(action)
    }

    /// Push an `Action`
    ///
    /// - Parameters:
    ///   - action: `Action` to push
    @discardableResult
    func pushAction(_ action: Action) -> Bool {
        let didHandle = Fusion.shared.handleAction(action)
        guard !didHandle else { return didHandle /* true */ }

        // `PageAction`
        if let pageAction = action as? PageAction {
            return pushPageAction(pageAction)

        // `NativeAction`
        } else if let nativeAction = action as? NativeAction {
            return pushNativeAction(nativeAction)

        // `LinkAction`
        } else if let linkAction = action as? LinkAction {
            return pushLinkAction(linkAction)

        // `EmailAction`
        } else if let emailAction = action as? EmailAction {
            return presentEmailAction(emailAction)
        }

        return false
    }

    // MARK: - PageAction

    /// Push a `PageAction`
    ///
    /// - Parameters:
    ///   - pageAction: `PageAction`
    private func pushPageAction(_ pageAction: PageAction) -> Bool {
        guard let pageURL = pageAction.entry?.toURL() else { return false }
        push(PageViewController(pageURL: pageURL))
        return true
    }

    // MARK: - NativeAction

    /// Push a `NativeAction`
    ///
    /// - Parameters:
    ///   - nativeAction: `NativeAction`
    private func pushNativeAction(_ nativeAction: NativeAction) -> Bool {
        return false // do nothing
    }

    // MARK: - LinkAction

    /// Push a `LinkAction`
    ///
    /// - Parameters:
    ///   - linkAction: `LinkAction`
    private func pushLinkAction(_ linkAction: LinkAction) -> Bool {
        guard let url = linkAction.url else { return false }
        let inApp = linkAction.inApp ?? false
        guard inApp else { return openURL(url) }
        return presentURL(url)
    }

    /// Push the given `url` in app
    ///
    /// - Parameter url: `URL`
    private func presentURL(_ url: URL) -> Bool {
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.delegate = SafariDelegate.shared
        present(safariViewController, animated: true, completion: nil)
        return true
    }

    /// Open the given `url`
    ///
    /// - Parameter url: `URL`
    private func openURL(_ url: URL) -> Bool {
        guard UIApplication.shared.canOpenURL(url) else { return false }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        return true
    }

    // MARK: - EmailAction

    /// Present an `EmailAction`
    ///
    /// - Parameters:
    ///   - emailAction: `EmailAction`
    private func presentEmailAction(_ emailAction: EmailAction) -> Bool {
        return presentEmailCompose(for: emailAction.email)
    }

    // MARK: - Push

    /// Push a `viewController` hiding the bottom bar if it should.
    ///
    /// - Parameters:
    ///   - viewController: `UIViewController`
    private func push(_ viewController: UIViewController) {
        // Pushing `action` should always hide the bottom tab bar
        viewController.hidesBottomBarWhenPushed = shouldHideBottomBarWhenPushed()

        // Push `viewController` on the `UINavigationController` stack
        pushViewController(viewController)
    }
}
