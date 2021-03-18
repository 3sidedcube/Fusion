//
//  Separator.swift
//  Fusion
//
//  Created by Ben Shutt on 17/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

/// A `CALayer` which draws a separator
public protocol Separator: CALayer {

    /// Update the separator path
    func updatePath()
}
