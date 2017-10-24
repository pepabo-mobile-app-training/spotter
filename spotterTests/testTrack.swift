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
        stub(condition: isHost("https://api.spotify.com/v1/users/kurukuru5284") && isPath("/playlists/1qhPhTZSuy9XfqurvqGwt8/tracks?offset=0&limit=10&market=JP")) { request in
            let stubPath = OHPathForFile("successFetchTrack.json", type(of: self))
            return fixture(filePath: stubPath!, headers: ["Content-Type":"application/json"])
        }
        let fetchTrackException: XCTestExpectation? =  self.expectation(description: "fetchTracklist")
        Tracks.fetchTracklist(playlistID: "1qhPhTZSuy9XfqurvqGwt8"){ tracks in
            XCTAssertEqual("暴れだす - full version", tracks[0].name)
            fetchTrackException?.fulfill()
        }
        self.waitForExpectations(timeout: 3, handler: nil)
    }
}
