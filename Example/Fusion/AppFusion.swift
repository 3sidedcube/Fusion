//
//  AppFusion.swift
//  Example
//
//  Created by Ben Shutt on 15/03/2021.
//

import Foundation
import Fusion

class AppFusion: Fusion {

    override var jsonModelTypes: [JSONModel.Type] {
        return super.jsonModelTypes + [Card.self]
    }
}
