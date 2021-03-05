//
//  ListView.swift
//  CBIT
//
//  Created by Ben Shutt on 07/12/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import SwiftyJSON

/// List of `TableSection`s to drive a `UITableViewController`
public struct ListView: Codable {

    /// `JSON` array of child nodes to drive subview content.
    /// This is dynamic, the type of each JSON element may be different.
    public var children: JSON
}
