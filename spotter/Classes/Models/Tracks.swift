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

class Tracks{
    var name: String
    var album_name: String
    var imgURL: URL
    var url: URL
    
    init(name: String, album_name: String, imgURL: URL,url:URL) {
        self.name = name
        self.album_name = album_name
        self.imgURL = imgURL
        self.url = url
    }
    
    static func jsonTracklist(_ json: JSON) -> Array<Tracks> {
        return json["items"].arrayValue.map {
            Tracks(
                name: $0["track"]["name"].stringValue,
                album_name: $0["track"]["album"]["name"].stringValue,
                imgURL: ($0["track"]["album"]["images"][1]["url"].url)!,
                url: ($0["track"]["preview_url"].url)!)
        }
    }
    
    static func fetchTracklist(playlistID: String, handler: @escaping ((Array<Tracks>) -> Void)) {
        let OathToken = env["OAUTH_TOKEN"]
        APIClient.spotifyAPIRequest(endpoint: Endpoint.fetchTrack(playlistID), OathToken: OathToken!){ json in
            return handler(jsonTracklist(json))
        }
    }
}

