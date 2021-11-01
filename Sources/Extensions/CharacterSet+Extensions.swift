//
//  CharacterSet+Extensions.swift
//  Fusion
//
//  Created by Ben Shutt on 27/10/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

extension CharacterSet {

    /// Hexadecimal characters (uppercase and lowercase)
    static var hexadecimal: CharacterSet {
        return CharacterSet(charactersIn: "0123456789abcdefABCDEF")
    }
}
