//  Copyright © 2020 Erica Sadun. All rights reserved.

import XCTest
import GeneralUtility

class StringTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testStrings() throws {
        XCTAssertEqual(" ".trimmed(), "")
        XCTAssertEqual("a\nb".trimmed(), "a\nb")
        XCTAssertEqual("a\nb\n".trimmed(), "a\nb")
    }
}
