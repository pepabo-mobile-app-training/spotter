//
//  spotifyPlaylist.swift
//  spotter
//
//  Created by futoshi.endo on 2017/10/23.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import Foundation
import SwiftyJSON

let env = ProcessInfo.processInfo.environment
let OathToken = env["OAUTH_TOKEN"]
let playlistID = env["PLAYLIST_ID"]

class spotifyPlaylist{
    var track_name: String
    var album_name: String
    var imgURL: URL
    var track_url: URL
    
    init(track_name: String, album_name: String, imgURL: URL,track_url:URL) {
        self.track_name = track_name
        self.album_name = album_name
        self.imgURL = imgURL
        self.track_url = track_url
    }
    
    static func jsonToPlaylist(_ json: JSON) -> Array<spotifyPlaylist> {
        return json["items"].arrayValue.map {
            spotifyPlaylist(
                track_name: $0["track"]["name"].stringValue,
                album_name: $0["track"]["album"]["name"].stringValue,
                imgURL: ($0["track"]["album"]["images"][1]["url"].url)!,
                track_url: ($0["track"]["preview_url"].url)!)
        }
    }
    
    static func fetchPlaylist(handler: @escaping ((Array<spotifyPlaylist>) -> Void)) {
        spotifyAPIRequest(OathToken: OathToken!, playlistID: playlistID!){ json in
            return handler(jsonToPlaylist(json))
        }
    }

}
