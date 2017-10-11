//
//  timelineViewUITest.swift
//  spotterUITests
//
//  Created by futoshi.endo on 2017/10/04.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import XCTest

class timelineViewUITest: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testtimeLineViewElement() {
        let app = XCUIApplication()
        app.buttons["タイムライン画面"].tap()

        XCTAssert(app.staticTexts["usernameLabel"].exists)
        XCTAssert(app.images["profileImage"].exists)
        XCTAssert(app.buttons["tweetButton"].exists)
        
        //カスタムテーブルビューセルの要素を確認する。
        sleep(10)
        XCTAssert(app.tables.staticTexts["tweetTexLabel"].exists)
        XCTAssert(app.tables.images["faceImageView"].exists)
    }
    
}
