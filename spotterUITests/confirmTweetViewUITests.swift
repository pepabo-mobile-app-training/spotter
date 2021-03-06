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
        app.buttons["Tweet確認画面へ"].tap()
        XCTAssert(app.textViews["confirmTweetTextField"].exists)
        XCTAssert(app.buttons["エモート"].exists)
    }
    
}
