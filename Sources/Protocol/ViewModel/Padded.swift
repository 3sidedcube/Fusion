//
//  Insettable.swift
//  Fusion
//
//  Created by Ben Shutt on 06/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

/// Entity supports `Padding`
public protocol Padded {

    /// Get and set `Padding`
    var padding: Padding { get set }
}
