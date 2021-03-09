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
    case sample = "794c3e8d-c04f-41e8-b56a-92b5f1ca39bf"
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
