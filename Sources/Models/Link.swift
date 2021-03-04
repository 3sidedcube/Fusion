//
//  Link.swift
//  CBIT
//
//  Created by Ben Shutt on 24/01/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// Structure to `Link` to a URL
struct Link: Codable, Identifiable {

    /// Unique id of the article
    var id: UUID

    /// Title of the article
    var title: String?

    /// `URL` `String` of the article
    var url: String?
}

extension Link {

    /// `url` to `URL`
    var urlFromString: URL? {
        guard let url = url else { return nil }
        return URL(string: url)
    }
}
