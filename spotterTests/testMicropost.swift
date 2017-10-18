//
//  testMicropost.swift
//  spotterTests
//
//  Created by futoshi.endo on 2017/10/13.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import XCTest
@testable import spotter
import OHHTTPStubs

class testMicropost: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFetchMicroposts() {
        let fetchMicropostException: XCTestExpectation? =  self.expectation(description: "fetchMicropost")
       
         Micropost.fetchMicroposts(userID: 1) { microposts in
            XCTAssertTrue(microposts.count > 1)
            fetchMicropostException?.fulfill()
        }
        self.waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testPushMicropost() {
        stub(condition: isHost("piyorin.xyz") && isPath("/api/microposts/create")) { request in
            let stubPath = OHPathForFile("successCreateMicropost.json", type(of: self))
            return fixture(filePath: stubPath!, headers: ["Content-Type":"application/json"])
        }
        
        let userID = 1
        let content = "fugafuga"
        let pushMicropostException: XCTestExpectation? =  self.expectation(description: "pushMicropost")
        Micropost.pushMicropost(userID: userID, content: content) { micropost in
            XCTAssertEqual(content, micropost.content)
            pushMicropostException?.fulfill()
        }
        self.waitForExpectations(timeout: 3, handler: nil)
    }
}
