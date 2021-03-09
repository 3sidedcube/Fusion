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
    case sample = "f3adbc4b-ba74-4afb-a325-5ab6296956c4"
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
