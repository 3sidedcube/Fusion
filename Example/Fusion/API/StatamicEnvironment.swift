//
//  StatamicEnvironment.swift
//  Example
//
//  Created by Ben Shutt on 09/03/2021.
//

import Foundation

/// Statamic CMS endpoint
enum StatamicEnvironment: String {

    /// Live (production) environment
    case live
}

// MARK: - Environment

extension StatamicEnvironment {

    /// Default `StatamicEnvironment` to fall back to
    static var `default`: StatamicEnvironment {
        return .live
    }
}

// MARK: - URL

extension StatamicEnvironment {

    /// Host address
    var host: String {
        switch self {
        case .live: return "statamic-fusion-api.cubeapis.com"
        }
    }
}
