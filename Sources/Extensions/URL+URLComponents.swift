//
//  URL+URLComponents.swift
//  Fusion
//
//  Created by Ben Shutt on 17/03/2021.
//

import Foundation

public extension URL {

    /// Map this `URL` to `URLComponents` throwing `Error` on failure
    ///
    /// - Parameter resolvingAgainstBaseURL: `Bool`
    func toURLComponents(
        resolvingAgainstBaseURL: Bool = true
    ) throws -> URLComponents {
        guard let urlComponents = URLComponents(
            url: self,
            resolvingAgainstBaseURL: true
        ) else {
            throw URLComponentsError.invalidURL(self, resolvingAgainstBaseURL)
        }

        return urlComponents
    }
}

/// `Error` with `URLComponents`
public enum URLComponentsError: Error {

    /// Failed to create `URLComponents` from the given `URL`
    /// - `URL`, the `URL` which could not be parsed to `URLComponents`
    /// - `Bool`, was it resolved against the base URL
    case invalidURL(URL, Bool)
}
