//
//  testTimelineHelper.swift
//  spotterTests
//
//  Created by komei.nomura on 2017/10/25.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import XCTest
@testable import spotter

class testTimelineHelper: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetMatchStrings() {
        let textIncludeUrl = "hogehoge\nhttps://example.com"
        let text = "hogehoge"
        let regularExpressionUrl = "(http://|https://){1}[\\w\\.\\-/:]+"
        
        var urls = TimelineHelper.getMatchStrings(targetString: textIncludeUrl, pattern: regularExpressionUrl)
        
        XCTAssert(urls.count > 0)
        
        urls = TimelineHelper.getMatchStrings(targetString: text, pattern: regularExpressionUrl)
        
        XCTAssert(urls.count == 0)
    }
}
