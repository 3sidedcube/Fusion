//
//  PageId.swift
//  Example
//
//  Created by Ben Shutt on 09/03/2021.
//

import Foundation

/// Fixed `Page` IDs
enum PageId: String {

    /// Sample/example page to test data driven UI
    case sample = "57517db9-8eba-425f-9fb3-c63e9e9e8521"
}

// MARK: - URL

extension PageId {

    /// Map to `URL`
    func toURL() throws -> URL {
        let endpoint = "collections/articles/entries/\(rawValue)"
        let urlComponents: URLComponents = .statamicAPI(endpoint: endpoint)
        return try urlComponents.asURL()
    }
}
