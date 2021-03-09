//
//  Debug.swift
//  CBIT
//
//  Created by Ben Shutt on 05/01/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// Debug environment configuration
struct Debug {

    /// Returns `true` if the `DEBUG` preprocessor macro is defined
    static var isDebugging: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
}
