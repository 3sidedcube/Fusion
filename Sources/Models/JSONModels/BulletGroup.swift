//
//  BulletGroup.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// An ordered grouping of `Bullet`s
public struct BulletGroup: Codable, JSONModel {

    /// The `Bullet` children
    public var children: [Bullet]
}
