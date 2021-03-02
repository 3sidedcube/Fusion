import XCTest
@testable import Fusion

// swiftlint:disable empty_xctest_method

final class FusionTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(Fusion().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample)
    ]
}
