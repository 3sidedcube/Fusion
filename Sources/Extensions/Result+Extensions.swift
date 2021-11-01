//
//  Result+Extensions.swift
//  Fusion
//
//  Created by Ben Shutt on 27/10/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

extension Result {

    /// Get the associated success value or throw
    func successOrThrow() throws -> Success {
        switch self {
        case let .success(success): return success
        case let .failure(failure): throw failure
        }
    }
}
