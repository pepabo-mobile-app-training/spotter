//
//  tweetViewUITests.swift
//  spotterUITests
//
//  Created by komei.nomura on 2017/10/02.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import XCTest

class tweetViewUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()

    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTweetViewElement() {
        let app = XCUIApplication()
        app.buttons["Tweet画面へ"].tap()
        
        let buttonNames = ["#嬉しい", "#楽しい", "#怒る", "#悲しい"]
        buttonNames.forEach { buttonName in
            XCTAssert(app.buttons[buttonName].exists)
        }
        
        let descriptionLabel = app.staticTexts["descriptionLabel"]
        XCTAssert(descriptionLabel.exists)
        XCTAssertEqual("今の気持ちを選択", descriptionLabel.label)
        
        let tweetTextView = app.textViews["tweetTextField"]
        XCTAssert(tweetTextView.exists)
        tweetTextView.tap()
        tweetTextView.typeText("hello")
        XCTAssertEqual("hello", tweetTextView.value as! String)
    }
    
}
