//
//  Card.swift
//  Example
//
//  Created by Ben Shutt on 15/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import Fusion

/// A model which drives a card UI
struct Card: Codable, JSONModel {

    /// `Image` to fetch from remote API
    var image: Entry?

    /// `Text` for title
    var title: String?

    /// `Text` for subtitle
    var subtitle: String?
}
