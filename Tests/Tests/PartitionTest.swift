//  Copyright © 2020 Erica Sadun. All rights reserved.

import XCTest
import GeneralUtility

class PartitionTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testPartition() throws {
        var source = [1, 5, -3, 6, 9]

        var splitLessTen = source.partitionSplit { $0 < 10 }
        XCTAssert(splitLessTen.notMatching.isEmpty)
        XCTAssert(splitLessTen.matching.count == source.count)

        let splitNegative = splitLessTen.matching.partitionSplit { $0 < 0 }
        XCTAssert(splitNegative.matching.count == 1)
    }
}
