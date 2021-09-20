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

public extension MFMailComposeViewController {

    /// Create an `MFMailComposeViewController`
    ///
    /// - Parameters:
    ///   - email: `Email`
    ///   - delegate: `MFMailComposeViewControllerDelegate`
    ///
    /// - Returns: `MFMailComposeViewController`
    static func mailCompose(
        email: Email,
        delegate: MFMailComposeViewControllerDelegate = EmailDelegate.shared
    ) -> MFMailComposeViewController {

        // Create a `MFMailComposeViewController`
        let viewController = MFMailComposeViewController()
        viewController.mailComposeDelegate = delegate

        // Configure the fields of the interface.
        viewController.setToRecipients(email.to)
        viewController.setCcRecipients(email.cc)
        viewController.setBccRecipients(email.bcc)
        viewController.setSubject(email.subject ?? "")
        viewController.setMessageBody(
            email.body?.content ?? "",
            isHTML: email.body?.isHTML ?? false
        )

        return viewController
    }
}

// MARK: - UIViewController + Email

public extension UIViewController {

    /// First attempt to present an `MFMailComposeViewController` if available.
    /// If not available push the first `EmailClient` where the email compose `URL`
    /// can be opened.
    ///
    /// - Parameters:
    ///   - email: `Email` content
    ///   - delegate: `MFMailComposeViewControllerDelegate`
    ///   - animated: `Bool` present animation
    func presentEmailCompose(
        for email: Email,
        delegate: MFMailComposeViewControllerDelegate = EmailDelegate.shared,
        animated: Bool = true
    ) -> Bool {
        guard MFMailComposeViewController.canSendMail() else {
            return openFirstEmailClient(for: email)
        }

        // Create a `MFMailComposeViewController`
        let viewController: MFMailComposeViewController = .mailCompose(
            email: email,
            delegate: delegate
        )

        // Present the view controller modally.
        present(viewController, animated: animated)
        return true
    }

    /// Open the first `EmailClient` compose email `URL` which can be opened
    ///
    /// - Parameter email: `Email`
    private func openFirstEmailClient(for email: Email) -> Bool {
        let composeURL = UIApplication.shared
            .availableMailClients(email: email)
            .first

        guard let url = composeURL else { return false }
        UIApplication.shared.open(url, options: [:])
        return true
    }
}

// MARK: - UIApplication + Email

public extension UIApplication {

    /// `URL`s of `EmailClient`s installed on the user's device
    ///
    /// - Parameter email: `Email`
    /// - Returns: `[URL]`
    func availableMailClients(email: Email) -> [URL] {
        return EmailClient.allCases
            .compactMap { URL(string: $0.composePattern(for: email)) }
            .filter { canOpenURL($0) }
    }
}
