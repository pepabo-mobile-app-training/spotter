//
//  TimeLineUITests.swift
//  spotterUITests
//
//  Created by futoshi.endo on 2017/10/02.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import XCTest

class TimeLineUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTimeLineViewElement() {
        let app = XCUIApplication()
        app.buttons["タイムライン画面"].tap()
        
        // プロフィール画面の要素を確認する。
        let profileElements = ["usernameLabel", "useridLavel", "tweetButton", "profileImage"]
        
        profileElements.forEach { profileElement in
            XCTAssert(app.staticTexts["usernameLabel"].exists)
        }

        //カスタムテーブルビューセルの要素を確認する。
        
    }
    
}
