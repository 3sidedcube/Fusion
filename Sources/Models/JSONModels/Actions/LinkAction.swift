//
//  LinkAction.swift
//  Fusion
//
//  Created by Ben Shutt on 08/01/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// `Action` to open an external `URL`
public struct LinkAction: Codable, Action {

    /// `String` for a `URL` 
    public var link: String?

    /// Does the link get pushed in app or opened in an external browser app like Safari or Chrome.
    public var inApp: Bool?
}

// MARK: - Extensions

public extension LinkAction {

    /// `link` to `URL`
    var url: URL? {
        guard let link = link else { return nil }
        return URL(string: link)
    }
}
