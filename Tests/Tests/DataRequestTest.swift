//  Copyright © 2020 Erica Sadun. All rights reserved.

import XCTest
import GeneralUtility

class DataRequestTests: XCTestCase {
    func testSync() throws {
        let url = URL(string: "https://google.com")
        XCTAssertNotNil(url)
        XCTAssertNoThrow(try {
            let data = try Utility.requestSynchronousData(URLRequest(url: url!))
            XCTAssertFalse(data.count == 0)
        }())
    }
    
    func testSync2() throws {
        let url = URL(string: "https://notarealthingatallprobablynotnononononotatall")
        XCTAssertNotNil(url)
        XCTAssertThrowsError(try {
            _ = try Utility.requestSynchronousData(URLRequest(url: url!))
        }())
    }
    
    func testAsync() throws {
        let url = URL(string: "https://google.com/")
        XCTAssertNotNil(url)
        let expectation = XCTestExpectation(description: "Perform async download")
        Utility.requestAsynchronousData(URLRequest(url: url!), completion: { result in
            if case .success = result {
                expectation.fulfill()
            } else {
                XCTFail("Result is failure")
            }
        })
        wait(for: [expectation], timeout: 10.0)
    }
}


