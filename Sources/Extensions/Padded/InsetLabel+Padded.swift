//
//  InsetLabel+Padded.swift
//  Fusion
//
//  Created by Ben Shutt on 11/03/2021.
//

import Foundation
import UIKit

extension InsetLabel: Padded {

    var padding: Padding {
        get {
            return Padding(insets: insets)
        }
        set {
            insets = newValue.insets
        }
    }
}
