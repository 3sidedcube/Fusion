//
//  SafariDelegate.swift
//  Fusion
//
//  Created by Ben Shutt on 12/03/2021.
//

import Foundation
import SafariServices

/// A singleton instance which conforms to `SFSafariViewControllerDelegate`
/// to simply dismiss the `SFSafariViewController` when it has finished.
/// This allows `UIViewController`s to present an `SFSafariViewController`
/// without having to also conform to `SFSafariViewControllerDelegate`
class SafariDelegate: NSObject, SFSafariViewControllerDelegate {

    /// Shared singleton `SafariDelegate` instance
    public static let shared = SafariDelegate()

    // MARK: - Init

    /// `private` initializer
    override private init() {
        super.init()
    }

    // MARK: - SFSafariViewControllerDelegate

    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
