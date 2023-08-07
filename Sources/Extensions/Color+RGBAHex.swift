//
//  Color+RGBAHex.swift
//  Fusion
//
//  Created by Ben Shutt on 02/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

extension Color {

    init?(hex: RGBAHex?) {
        guard let hex else { return nil }
        self.init(hexString: hex)
    }
}
