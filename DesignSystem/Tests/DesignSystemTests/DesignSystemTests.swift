import XCTest
import SwiftUI
@testable import DesignSystem

final class DesignSystemTests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
    }

    func test_messageBubbleView_bothAlignments_buildsWithoutCrashing() throws {
        let leading = MessageBubbleView(text: "Received", backgroundColor: .gray, alignment: .leading)
        let trailing = MessageBubbleView(text: "Sent", backgroundColor: .blue, alignment: .trailing)

        XCTAssertNotNil(leading.body)
        XCTAssertNotNil(trailing.body)
    }
}
