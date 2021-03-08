//
//  LinkAction.swift
//  CBIT
//
//  Created by Ben Shutt on 08/01/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// `ArticleAction` from the CMS
struct LinkAction: Codable, Action {

    /// Web `String` for a `URL`
    var link: String?

    /// Does the link get pushed in app
    var inApp: Bool?
}

// MARK: - Extensions

extension LinkAction {

    /// `link` to `URL`
    var url: URL? {
        guard let link = link else { return nil }
        return URL(string: link)
    }
}
