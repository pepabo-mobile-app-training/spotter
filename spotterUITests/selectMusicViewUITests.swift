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
        app.buttons["曲選択画面へ"].tap()
        
        let descriptionLabel = app.staticTexts["descriptionLabel"]
        XCTAssertEqual("今の気持ちに合う曲を選択", descriptionLabel.label)
        
        let emotionLabel = app.staticTexts["emotionLabel"]
        XCTAssertEqual("#嬉しい", emotionLabel.label)
        
        XCTAssert(app.tables.element(boundBy: 0).exists)
    }
    
}
