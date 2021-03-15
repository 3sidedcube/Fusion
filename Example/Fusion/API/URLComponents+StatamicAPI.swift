//
//  URLComponents+StatamicAPI.swift
//  CBIT
//
//  Created by Ben Shutt on 24/01/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

extension URLComponents {

    /// `URLComponents` template for `StatamicAPI` requests given `endpoint` and `queryItems`
    ///
    /// - Parameters:
    ///   - endpoint: `String`
    ///   - queryItems: `[URLQueryItem]`
    static func statamicAPI(
        endpoint: String,
        queryItems: [URLQueryItem] = []
    ) -> URLComponents {
        var urlComponents = URLComponents()

        urlComponents.scheme = "https"
        urlComponents.host = StatamicEnvironment.live.host
        urlComponents.path = "/api/\(endpoint)"
        urlComponents.queryItems = queryItems

        return urlComponents
    }
}
