//
//  testTrack.swift
//  spotterTests
//
//  Created by futoshi.endo on 2017/10/24.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import spotter

class testTrack: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }
    
    func testFetchTrack() {
        stub(condition: isScheme("https") && isHost("api.spotify.com"))  { request in
            return OHHTTPStubsResponse(
                fileAtPath: OHPathForFile("successFetchTrack.json", type(of: self))!,
                statusCode: 200,
                headers: ["Content-Type":"application/json"]
            )
        }
        let fetchTrackException: XCTestExpectation? =  self.expectation(description: "fetchTracklist")
        Track.fetchTracklist(playlistID: "1qhPhTZSuy9XfqurvqGwt8"){ tracks in
            XCTAssertEqual("暴れだす - full version", tracks[0].name)
            fetchTrackException?.fulfill()
        }
        self.waitForExpectations(timeout: 3, handler: nil)
    }
}

