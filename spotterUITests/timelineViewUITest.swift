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
        
        let profileElements = ["usernameLabel", "useridLabel"]
        profileElements.forEach { profileElement in
            XCTAssert(app.staticTexts[profileElement].exists)
        }
        XCTAssert(app.images["profileImage"].exists)
        XCTAssert(app.buttons["tweetButton"].exists)
        
        //カスタムテーブルビューセルの要素を確認する。
        XCTAssert(app.tables/*@START_MENU_TOKEN@*/.textViews["emoteTextBox"]/*[[".cells.textViews[\"emoteTextBox\"]",".textViews[\"emoteTextBox\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.exists)
        XCTAssert(app.tables.images["faceImageView"].exists)
    }
    
}
