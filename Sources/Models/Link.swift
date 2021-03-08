//
//  Link.swift
//  CBIT
//
//  Created by Ben Shutt on 24/01/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// Structure to `Link` to a URL
public struct Link: Codable, Identifiable {

    /// Unique id of the article
    public var id: UUID

    /// Title of the article
    public var title: String?

    /// `URL` `String` of the article
    public var url: String?
}

public extension Link {

    /// `url` to `URL`
    func toURL() -> URL? {
        guard let url = url else { return nil }
        return URL(string: url)
    }
}
