//
//  Size+CGSize.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

public extension Size {

    /// Map `Size` to `CGSize`
    var cgSize: CGSize? {
        guard let width = width, let height = height else { return nil }
        return CGSize(width: CGFloat(width), height: CGFloat(height))
    }
}
