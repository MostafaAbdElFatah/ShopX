//
//  ApiManagerTest.swift
//  ShopXTests
//
//  Created by Labeeb on 1/1/19.
//  Copyright © 2019 Mostafa AbdEl Fatah. All rights reserved.
//

import XCTest
@testable import ShopX

class ApiManagerTest: XCTestCase {
    
    var apiManager: ApiManager!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testApiManagerGetData(){
        apiManager = ApiManager.init()
        let expectation = XCTestExpectation.init(description: "getting data")
        apiManager.getData { (menu, error) in
            XCTAssertNotNil(menu)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
