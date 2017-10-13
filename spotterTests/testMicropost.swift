//
//  testMicropost.swift
//  spotterTests
//
//  Created by futoshi.endo on 2017/10/13.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import XCTest
@testable import spotter

class testMicropost: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFetchMicroposts() {
         Micropost.fetchMicropost(userID: 1) { microposts in
            XCTAssertNotNil(microposts)
        }
    }
}
