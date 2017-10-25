//
//  tweetTransitionUITests.swift
//  spotterUITests
//
//  Created by komei.nomura on 2017/10/06.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import XCTest

class tweetTransitionUITest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNavigationBarTransition() {
        let app = XCUIApplication()
        app.buttons["タイムライン画面"].tap()
        // ツイート画面へ
        app/*@START_MENU_TOKEN@*/.buttons["tweetButton"]/*[[".buttons[\"Button\"]",".buttons[\"tweetButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        sleep(1)
        XCTAssertFalse(app.images["profileImage"].exists)
        XCTAssert(app.textViews["tweetTextField"].exists)
        
        // 曲選択画面へ
        app.buttons["#楽しい"].tap()
        sleep(1)
        XCTAssertFalse(app.textViews["tweetTextField"].exists)
        XCTAssert(app.tables.element(boundBy: 0).exists)
        
        // ツイート画面へ（NavigationBarを使って）
        app.navigationBars["spotter.SelectMusicView"].buttons["Back"].tap()
        XCTAssertFalse(app.tables.element(boundBy: 0).exists)
        XCTAssert(app.textViews["tweetTextField"].exists)
        
        // タイムライン画面へ
        app.navigationBars.buttons["Stop"].tap()
        XCTAssertFalse(app.textViews["tweetTextField"].exists)
        XCTAssert(app.images["profileImage"].exists)
    }
    
}
