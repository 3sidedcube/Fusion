//
//  OSLog+Logger.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import Foundation
import os // OSLog

extension OSLog {

    /// Framework `OSLog` shared instance
    static let logger = OSLog(
        subsystem: Bundle.main.bundleIdentifier ?? "\(Fusion.self)",
        category: "\(Fusion.self)"
    )
}
