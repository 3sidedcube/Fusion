//
//  TableSection.swift
//  CBIT
//
//  Created by Ben Shutt on 07/12/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import SwiftyJSON

/// CMS section of a `UITableView`
public struct TableSection: Codable {

    /// Header `Text`
    //public var header: Text?

    /// Footer `Text`
    //public var footer: Text?

    /// Array of child nodes. This is dynamic, the type of each JSON element may be different
    public var children: JSON
}
