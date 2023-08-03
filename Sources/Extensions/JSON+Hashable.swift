//
//  JSON+Hashable.swift
//  Fusion
//
//  Created by Ben Shutt on 03/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import SwiftyJSON

// TODO: Can we do this?

extension JSON: Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine(rawString() ?? "")
    }
}
