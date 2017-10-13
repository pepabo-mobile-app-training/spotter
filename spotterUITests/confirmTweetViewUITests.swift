//
//  confirmTweetViewUITests.swift
//  spotterUITests
//
//  Created by komei.nomura on 2017/10/03.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import XCTest

class confirmTweetViewUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testConfirmTweetView() {
        
        let app = XCUIApplication()
        app.buttons["タイムライン画面"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["tweetButton"]/*[[".buttons[\"Button\"]",".buttons[\"tweetButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let tweettextfieldTextView = app.textViews["tweetTextField"]
        tweettextfieldTextView.tap()
        let tweetText = "Hello"
        tweettextfieldTextView.typeText(tweetText)
        let emotionButtonText = "#嬉しい"
        app.buttons[emotionButtonText].tap()
        let musicLabel = "hogefugapiyohogehoge"
        let musicURL = "http://hogehoge"
        app.tables.children(matching: .cell).element(boundBy: 0).staticTexts[musicLabel].tap()
        let confirmTweetText = app.textViews["confirmTweetTextField"].value as! String
        XCTAssertEqual("\(tweetText)\n\(emotionButtonText)\n\(musicLabel)(\(musicURL))", confirmTweetText)

    }
    
}
