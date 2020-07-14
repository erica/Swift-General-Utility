//  Copyright © 2020 Erica Sadun. All rights reserved.

import XCTest
import GeneralUtility

fileprivate extension Double {
    static let reasonableAccuracy = 1e-9
}

class MathTest: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
   
    func testExponentiation() throws {
        XCTAssertEqual(2 ** 5, 32)
        XCTAssertEqual(2 ** 5.0, 32)
        XCTAssertEqual(64.0 ** 0.5, 8.0, accuracy: .reasonableAccuracy)
        XCTAssertEqual(8.0 ** 2, 64.0, accuracy: .reasonableAccuracy)
    }
    
    func testRounding() throws {
        XCTAssertEqual(Double.pi.rounding(places: 3), 3.142, accuracy: .reasonableAccuracy)
        XCTAssertEqual("\(Double.pi, roundingPlaces: 3)", "3.142")
    }
}
