//
//  selectMusicViewUITests.swift
//  spotterUITests
//
//  Created by komei.nomura on 2017/10/05.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import XCTest

class selectMusicViewUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSelectMusicView() {
        let app = XCUIApplication()
        app.buttons["タイムライン画面"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["tweetButton"]/*[[".buttons[\"Button\"]",".buttons[\"tweetButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["#嬉しい"].tap()
        sleep(1)
        
        let descriptionLabel = app.staticTexts["descriptionLabel"]
        XCTAssertEqual("今の気持ちに合う曲を選択", descriptionLabel.label)
        
        let emotionLabel = app.staticTexts["emotionLabel"]
        XCTAssert(emotionLabel.exists)
        XCTAssertEqual(emotionLabel.label, "#嬉しい")
        
        XCTAssert(app.tables.element(boundBy: 0).exists)
    }
    
}
