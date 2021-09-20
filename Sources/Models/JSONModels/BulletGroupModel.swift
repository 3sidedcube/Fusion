//
//  BulletGroupModel.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// An ordered list of `BulletModel`s
public struct BulletGroupModel: Codable, JSONModel {

    /// The `Bullet` children
    public var children: [BulletModel]
}
