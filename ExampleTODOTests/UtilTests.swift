//
//  UtilTests.swift
//  ExampleTODOTests
//
//  Created by LYJ on 21/05/2019.
//  Copyright © 2019 이영주. All rights reserved.
//

import XCTest
@testable import ExampleTODO

class UtilTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func queueTest() {
        var queue = ArrayQueue<String>()
        queue.push("hello")
        XCTAssertNotNil(queue.pop())
    }

}
