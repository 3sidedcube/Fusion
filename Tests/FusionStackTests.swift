//
//  FusionStackTests.swift
//  Fusion
//
//  Created by Ben Shutt on 04/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import XCTest
@testable import Fusion

@MainActor final class FusionStackTests: XCTestCase {

    func testDecode() throws {
        _ = try FusionStack.decode(from: "Stack")
    }
}
