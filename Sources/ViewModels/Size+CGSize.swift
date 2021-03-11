//
//  Size+CGSize.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import Foundation
import UIKit

extension Size {

    /// Map `Size` to `CGSize`
    var cgSize: CGSize? {
        guard let width = width, let height = height else { return nil }
        return CGSize(width: CGFloat(width), height: CGFloat(height))
    }
}
