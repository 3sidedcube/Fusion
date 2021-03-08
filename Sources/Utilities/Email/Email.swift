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
        public var content: String

        /// Is `content` HTML
        public var isHTML: Bool

        // MARK: - Init

        public init(content: String, isHTML: Bool) {
            self.content = content
            self.isHTML = isHTML
        }
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

    // MARK: - Init

    /// Default `public` memberwise initializer
    /// - Parameters:
    ///   - toAddresses: `[String]`
    ///   - ccAddresses: `[String]`
    ///   - bccAddresses: `[String]`
    ///   - subject: `String?`
    ///   - body: `Body?`
    public init(
        toAddresses: [String],
        ccAddresses: [String],
        bccAddresses: [String],
        subject: String?,
        body: Body?
    ) {
        self.toAddresses = toAddresses
        self.ccAddresses = ccAddresses
        self.bccAddresses = bccAddresses
        self.subject = subject
        self.body = body
    }
}
