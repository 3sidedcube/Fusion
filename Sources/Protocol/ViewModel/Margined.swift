//
//  Margined.swift
//  Fusion
//
//  Created by Ben Shutt on 11/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// Entity supports `Margins`
public protocol Margined {

    /// Get and set `Margins`
    var margins: Margins { get set }
}
