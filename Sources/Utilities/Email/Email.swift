//
//  EmailContent.swift
//  Fusion
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

        /// Default public memberwise initializer
        ///
        /// - Parameters:
        ///   - content: `String`
        ///   - isHTML: `Bool`
        public init(content: String, isHTML: Bool) {
            self.content = content
            self.isHTML = isHTML
        }
    }

    /// Email addresses to send to
    public var to: [String]

    /// Email addresses to copy in
    public var cc: [String]

    /// Email addresses to blind copy in
    public var bcc: [String]

    /// Email subject
    public var subject: String?

    /// Email `Body`
    public var body: Body?

    // MARK: - Init

    /// Default `public` memberwise initializer
    /// 
    /// - Parameters:
    ///   - to: `[String]`
    ///   - cc: `[String]`
    ///   - bcc: `[String]`
    ///   - subject: `String?`
    ///   - body: `Body?`
    public init(
        to: [String],
        cc: [String] = [],
        bcc: [String] = [],
        subject: String?,
        body: Body?
    ) {
        self.to = to
        self.cc = cc
        self.bcc = bcc
        self.subject = subject
        self.body = body
    }
}
