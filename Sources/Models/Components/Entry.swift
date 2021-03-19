//
//  Entry.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// The location of an entity on the CMS
public struct Entry: Codable {

    /// `String` ID
    public var id: String?

    /// `String` title
    public var title: String?

    /// `String` remote `URL`
    public var url: String?

    /// `String` permalink
    public var permalink: String?

    /// `String` API `URL`
    public var apiUrl: String?
}

// MARK: - Extensions

public extension Entry {

    /// Convert `url` to `URL`
    func toURL() -> URL? {
        guard let url = url else { return nil }
        return URL(string: url)
    }

    /// Convert `apiUrl` to `URL`
    func toApiURL() -> URL? {
        guard let url = apiUrl else { return nil }
        return URL(string: url)
    }
}
