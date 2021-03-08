//
//  BulletGroup.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//

import Foundation

/// A grouping of `Bullet`s
public struct BulletGroup: Codable {

    /// The `Bullet` children
    public var children: [Bullet]
}
