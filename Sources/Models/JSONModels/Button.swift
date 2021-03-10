//
//  Button.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//

import Foundation

/// A `Text` with an `Action` and a disclosure chevron
public struct Button: Codable, JSONModel {

    /// `Text` to define styling
    public var text: Text?

    /// `Action` on click
    public var action: ActionJSON?
}
