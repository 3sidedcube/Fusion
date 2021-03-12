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
    case sample = "6199f440-70a6-4542-bf68-61ecb995752d"

    /// ID of page to test UI
    case test = "3d37856f-5f56-41d8-a04f-eedfa1482139"
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
