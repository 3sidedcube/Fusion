//
//  EmailDelegate.swift
//  CBIT
//
//  Created by Ben Shutt on 24/01/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import MessageUI

/// A singleton instance which conforms to `MFMailComposeViewControllerDelegate`
/// to simply dismiss the `MFMailComposeViewController` when it has finished.
/// This allows `UIViewController`s to present an `MFMailComposeViewController`
/// without having to also conform to `MFMailComposeViewControllerDelegate`
open class EmailDelegate: NSObject, MFMailComposeViewControllerDelegate {

    /// Shared singleton `EmailDelegate` instance
    public static let shared = EmailDelegate()

    // MARK: - Init

    /// `private` initializer
    override private init() {
        super.init()
    }

    // MARK: - MFMailComposeViewControllerDelegate

    open func mailComposeController(
        _ controller: MFMailComposeViewController,
        didFinishWith result: MFMailComposeResult,
        error: Error?
    ) {
        controller.dismiss(animated: true)
    }
}
