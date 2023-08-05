//
//  Definitions.swift
//  Fusion
//
//  Created by Ben Shutt on 01/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI
import SwiftyJSON
import CubeFoundationSwiftUI

/// Shorthand for model conformance
typealias Model = Equatable & Hashable & Codable

/// A model that can be decoded from JSON and rendered as a SwiftUI view
typealias DecodableView = Decodable & View

/// A model that can be decoded from JSON and modify a SwiftUI view
typealias DecodableViewModifier = Decodable & ViewModifier

/// A hex string of the form `#RRGGBBAA`
typealias RGBAHex = Color.RGBAHex

/// Denotes a `JSON` which represents an view
typealias ModelJSON = JSON

/// Denotes a `JSON` which represents an action
typealias ActionJSON = JSON

/// A `JSON` array
typealias JSONArray = [JSON]
