//
//  EmailAction.swift
//  CBIT
//
//  Created by Ben Shutt on 24/01/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// `EmailAction` from the CMS
public struct EmailAction: Codable, Action {

    /// Email addresses to send to
    public var to: [String]?

    /// Email addresses to send to
    public var cc: [String]?

    /// Email addresses to send to
    public var bcc: [String]?

    /// Email subject
    public var subject: String?

    /// Email body - text opposed to HTML
    public var body: String?

    /// Is the email body HTML
    public var isHTML: Bool?
}

// MARK: - EmailAction + Email

public extension EmailAction {

    /// Map to `Email`
    var email: Email {
        return Email(
            toAddresses: to ?? [],
            ccAddresses: cc ?? [],
            bccAddresses: bcc ?? [],
            subject: subject,
            body: .init(
                content: body ?? "",
                isHTML: isHTML ?? false
            )
        )
    }

    /// Initialize with `email`
    ///
    /// - Parameter email: `Email`
    init(email: Email) {
        to = email.toAddresses
        cc = email.ccAddresses
        bcc = email.bccAddresses
        subject = email.subject
        body = email.body?.content
        isHTML = email.body?.isHTML
    }
}
