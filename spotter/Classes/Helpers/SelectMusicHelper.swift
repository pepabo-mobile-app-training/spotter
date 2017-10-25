//
//  SelectMusicHelper.swift
//  spotter
//
//  Created by komei.nomura on 2017/10/25.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import Foundation

class SelectMusicHelper {
    
    static func getPlaylistIdFromEmotion(emotion: String) -> String {
        var playlistId = ""
        switch emotion {
        case "#嬉しい":
            playlistId = "1qhPhTZSuy9XfqurvqGwt8"
        case "#悲しい":
            playlistId = "5nA9X92cNSFUtyycKdyqLQ"
        case "#楽しい":
            playlistId = "4v9Q5ExqydRuHrevkaZP1f"
        case "#怒る":
            playlistId = "6UTBITpfHzDkaZUhoGuDMO"
        default:
            break
        }
        return playlistId
    }
}
