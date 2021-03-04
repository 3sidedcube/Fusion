//
//  EmailContent.swift
//  CBIT
//
//  Created by Ben Shutt on 27/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// Components of an email
public struct Email {

    /// Body of the `Email`
    public struct Body {

        /// Content of the `Body`
        var content: String

        /// Is `content` HTML
        var isHTML: Bool
    }

    /// Email addresses to send to
    public var toAddresses: [String] = []

    /// Email addresses to copy in
    public var ccAddresses: [String] = []

    /// Email addresses to blind copy in
    public var bccAddresses: [String] = []

    /// Email subject
    public var subject: String?

    /// Email `Body`
    public var body: Body?
}
