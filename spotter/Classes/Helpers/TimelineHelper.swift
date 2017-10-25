//
//  TimelineHelper.swift
//  spotter
//
//  Created by komei.nomura on 2017/10/25.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import Foundation

class TimelineHelper {
    // 正規表現にマッチした文字列を格納した配列を返す
    static func getMatchStrings(targetString: String, pattern: String) -> [String] {
        var matchStrings:[String] = []
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: [])
            let targetStringRange = NSRange(location: 0, length: (targetString as NSString).length)
            
            let matches = regex.matches(in: targetString, options: [], range: targetStringRange)
            
            for match in matches {
                let range = match.range(at: 0)
                let result = (targetString as NSString).substring(with: range)
                
                matchStrings.append(result)
            }
            return matchStrings
        } catch {}
        return []
    }
}
