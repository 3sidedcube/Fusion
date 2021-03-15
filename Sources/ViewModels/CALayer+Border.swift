//
//  CALayer+Border.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//

import Foundation
import UIKit

public extension CALayer {

    /// Set `border`
    /// 
    /// - Parameter border: `Border`
    func setBorder(_ border: Border?) {
        borderColor = border?.color?.hexColor?.cgColor
        borderWidth = CGFloat(border?.strokeWidth ?? 0)
    }
}
