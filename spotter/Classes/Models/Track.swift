//
//  spotifyPlaylist.swift
//  spotter
//
//  Created by futoshi.endo on 2017/10/23.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import Foundation
import SwiftyJSON
import SpotifyLogin

let env = ProcessInfo.processInfo.environment

class Track {
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
    
    static func jsonTracklist(_ json: JSON) -> Array<Track> {
        return json["items"].arrayValue.map {
            Track(
                name: $0["track"]["name"].stringValue,
                album_name: $0["track"]["album"]["name"].stringValue,
                imgURL: ($0["track"]["album"]["images"][1]["url"].url)!,
                url: ($0["track"]["preview_url"].url)!
            )
        }
    }
    
    static func fetchTracklist(playlistID: String, handler: @escaping ((Array<Track>) -> Void)) {
        SpotifyLogin.shared.getAccessToken() { token, error in
            // リモートだとSpotifyLoginによるtokenを取得できない為、CI上のテストを通す為に一時的に値を用意してる。
            var OauthToken:String! = "hogehoge"
            
            if OauthToken != nil {
                OauthToken = token
            }
            if(token != nil && error == nil) {
                APIClient.spotifyAPIRequest(endpoint: Endpoint.fetchTrack(playlistID), OauthToken: OauthToken) { json in
                    return handler(jsonTracklist(json))
                }
            }
        }
    }
}

