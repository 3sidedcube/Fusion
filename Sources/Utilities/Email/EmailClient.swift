//
//  EmailClient.swift
//  Fusion
//
//  Created by Ben Shutt on 27/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// An email client (application) which the user might have installed on their device
public enum EmailClient: String, CaseIterable {

    /// Default `mailto:` app 
    case `default`

    /// Google mail
    case gmail

    /// Air mail
    case airmail

    /// Microsoft Outlook
    case msOutlook

    /// Yahoo mail
    case yahoo

    /// Spark
    case spark
}

// MARK: - EmailClient + Pattern

public extension EmailClient {

    /// `URL` `String` to compose the given `email`
    ///
    /// - Parameters:
    ///   - email: `Email`
    func composePattern(for email: Email) -> String {
        let to = email.toAddresses.joined(separator: ",")
        let subject = (email.subject ?? "").percentEncoded
        let body = (email.body?.content ?? "").percentEncoded

        switch self {
        case .default:
            return "mailto:\(to)?subject=\(subject)&body=\(body)"
        case .gmail:
            return "googlemail://co?to=\(to)&subject=\(subject)&body=\(body)"
        case .airmail:
            return "airmail://compose?subject=\(subject)&to=\(to)&plainBody=\(body)"
        case .msOutlook:
            return "ms-outlook://compose?to=\(to)&subject=\(subject)&body=\(body)"
        case .yahoo:
            return "ymail://mail/compose?to=\(to)&subject=\(subject)&body=\(body)"
        case .spark:
            return "readdle-spark://compose?recipient=\(to)&subject=\(subject)&body=\(body)"
        }
    }
}

// MARK: - String + Percent Encoding

private extension String {

    /// Add percent encoding to this instance
    var percentEncoded: String {
        return addingPercentEncoding(
            withAllowedCharacters: .urlHostAllowed
        ) ?? self
    }
}
