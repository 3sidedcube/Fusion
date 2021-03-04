//
//  ListView.swift
//  CBIT
//
//  Created by Ben Shutt on 07/12/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// List of `TableSection`s to drive a `UITableViewController`
public struct ListView: Codable {

    /// Array of `TableSection` content
    public var children: [TableSection]
}
