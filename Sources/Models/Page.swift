//
//  Page.swift
//  Fusion
//
//  Created by Ben Shutt on 07/12/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// A data driven model to drive dynamic app content.
public struct Page: Codable, Identifiable {

    /// Universally unique identifier
    public var id: UUID

    /// Title text
    public var title: String?

    /// Date created
    public var date: Date?

    /// Date last updated
    public var lastModified: Date?

    /// Associated tag
    public var slug: String?

    /// Background hex color
    public var backgroundColor: RGBAHex?

    /// `Screen` (aka listView) to drive subview content
    public var screen: Screen?

    /// `String` API `URL`
    public var apiUrl: String?

    /// "screen_view" for analytics screen tracking
    public var analyticsScreenView: String?
}

// MARK: - Extensions

public extension Page {

    /// `URL` for API
    func apiURL() -> URL? {
        guard let apiUrl = apiUrl else { return nil }
        return URL(string: apiUrl)
    }
}
