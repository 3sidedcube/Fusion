//
//  Bullet.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//

import Foundation
import ThunderTable // RowConvertible

/// A bullet list item.
/// These items will likely be numbered and grouped into a `BulletGroup`
public class Bullet: ListItem {

    override func toRow() throws -> Row {
        return NumberRow(listItem: self)
    }
}
