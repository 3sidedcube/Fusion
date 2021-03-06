//
//  TextAlignment+NSTextAlignment.swift
//  Fusion
//
//  Created by Ben Shutt on 05/03/2021.
//

import Foundation
import UIKit

public extension TextAlignment {

    /// Map this `TextAlignment` instance to an `NSTextAlignment`
    var nsTextAlignment: NSTextAlignment {
        switch self {
        case .left: return .left
        case .right: return .right
        case .center: return .center
        case .justified: return .justified
        }
    }
}
