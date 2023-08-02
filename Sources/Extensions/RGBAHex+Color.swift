//
//  RGBAHex+Color.swift
//  Fusion
//
//  Created by Ben Shutt on 02/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI
import CubeFoundationSwiftUI

extension RGBAHex {

    var color: Color? {
        Color(hexString: self)
    }
}
