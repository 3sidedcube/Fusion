//
//  UIViewController+Email.swift
//  Fusion
//
//  Created by Ben Shutt on 27/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

public extension UIViewController {

    /// First attempt to present an `MFMailComposeViewController` if available.
    /// If not available push the first `EmailClient` where the email compose `URL`
    /// can be opened.
    ///
    /// - Parameters:
    ///   - email: `Email` content
    ///   - animated: `Bool` present animation
    ///   - delegate: `MFMailComposeViewControllerDelegate`
    func presentEmailCompose(
        for email: Email,
        animated: Bool = true,
        delegate: MFMailComposeViewControllerDelegate = EmailDelegate.shared
    ) -> Bool {
        guard MFMailComposeViewController.canSendMail() else {
            return openFirstEmailClient(for: email)
        }

        // Create a `MFMailComposeViewController`
        let viewController = MFMailComposeViewController()
        viewController.mailComposeDelegate = delegate

        // Configure the fields of the interface.
        viewController.setToRecipients(email.toAddresses)
        viewController.setCcRecipients(email.ccAddresses)
        viewController.setBccRecipients(email.bccAddresses)
        viewController.setSubject(email.subject ?? "")
        viewController.setMessageBody(
            email.body?.content ?? "",
            isHTML: email.body?.isHTML ?? false
        )

        // Present the view controller modally.
        present(viewController, animated: animated)
        return true
    }

    /// Open the first `EmailClient` compose email `URL` which can be opened
    ///
    /// - Parameter email: `Email`
    private func openFirstEmailClient(for email: Email) -> Bool {
        let composeURL = EmailClient.allCases
            .compactMap { URL(string: $0.composePattern(for: email)) }
            .first { UIApplication.shared.canOpenURL($0) }

        guard let url = composeURL else { return false }
        UIApplication.shared.open(url, options: [:])
        return true
    }
}
