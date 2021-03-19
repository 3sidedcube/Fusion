import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(FusionTests.allTests),
        testCase(UIColorExtensionsTests.allTests)
    ]
}
#endif
