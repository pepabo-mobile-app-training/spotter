//
//  testUser.swift
//  spotterTests
//
//  Created by futoshi.endo on 2017/10/13.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import XCTest
@testable import spotter

class testUser: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFetchUsers() {
        let fetchUsersException: XCTestExpectation? =  self.expectation(description: "fetchUsers")
        
        Users.fetchUsers(userID: 1) { users in
            XCTAssertEqual(users.userID, 1)
            fetchUsersException?.fulfill()
        }
        self.waitForExpectations(timeout: 3, handler: nil)
    }
}
