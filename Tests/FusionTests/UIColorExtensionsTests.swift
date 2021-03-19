//
//  UIColorExtensionsTests.swift
//  Example
//
//  Created by Ben Shutt on 19/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit
import XCTest
import Fusion

// swiftlint:disable empty_xctest_method
final class UIColorExtensionsTests: XCTestCase {

    /// Test converting `UIColor` to and from a HEX string
    func testHex() {
        textHex("#00000000")
        textHex("#FFFFFFFF")
        textHex("#000000FF")
        textHex("#FFFFFF00")
        textHex("#AC4B0DA2")
        textHex("#9EE412AB")
        textHex("#C9A100D2")
        textHex("#75B1F01A")
    }

    /// Convert the given `hexString` to a `UIColor`, convert back, and check they are the same
    ///
    /// - Parameter hexString: `String`
    private func textHex(_ hexString: String) {
        guard let color = UIColor(hexString: hexString) else {
            XCTFail("Failed to create \(UIColor.self) from HEX: \(hexString)")
            return
        }
        XCTAssertEqual(hexString, color.hexString(includeAlpha: true))
    }

    // MARK: - All Tests

    static var allTests = [
        ("textHex", textHex)
    ]
}
