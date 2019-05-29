//
//  ExampleTODOTests.swift
//  ExampleTODOTests
//
//  Created by YoungJu Lee on 16/01/2019.
//  Copyright © 2019 이영주. All rights reserved.
//

import XCTest
import RxSwift
@testable import ExampleTODO

class ExampleTODOTests: XCTestCase {

    override func setUp() {
        ApplicationContext.initialize(.test)
    }

    override func tearDown() {
        ApplicationContext.destroy()
    }
    
    func testAllPostModel() {
        let allPostModel: AllPostModelInterface = ApplicationContext.resolve()
        let postCount = allPostModel.getAllPost().value.count
        XCTAssertEqual(postCount, 4)
    }
}
