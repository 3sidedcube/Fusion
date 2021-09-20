//
//  InsetsModel+EdgeInsets.swift
//  Fusion
//
//  Created by Ben Shutt on 11/09/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import SwiftUI

extension InsetsModel {

    /// Map to `EdgeInsets`
    var insets: EdgeInsets {
        return EdgeInsets(
            top: top, leading: left, bottom: bottom, trailing: right
        )
    }
}
