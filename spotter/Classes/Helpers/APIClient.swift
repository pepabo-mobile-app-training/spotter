//
//  APIClient.swift
//  spotter
//
//  Created by futoshi.endo on 2017/10/12.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIClient {
    static private let baseUrl = "http://piyorin.xyz"
    static private let spotifyUrl = "https://api.spotify.com/v1/users/kurukuru5284"
    
    static func request(endpoint: Endpoint, params: [String: Any]=[:], handler: @escaping (_ json: JSON) -> Void) {
        let method = endpoint.method()
        let url = fullURL(endpoint: endpoint)
        
        Alamofire.request(url, method:method, parameters:params).validate(statusCode: 200...299).responseJSON { response in
            switch response.result {
            case .success(let value):
                handler(JSON(value))
            default:
                break
            }
        }
    }
    
    // Spotify Playlist
    static func spotifyAPIRequest(endpoint: Endpoint, OauthToken: String, handler: @escaping (_ json: JSON) -> Void) {
        let method = endpoint.method()
        let url = fullSpotifyURL(endpoint: endpoint)
        
        print("spotifyAPIRequest呼ばれたよ!")
        let headers: HTTPHeaders = [
            "Authorization": "Bearer  \(String(OathToken))"
        ]
        print("OATh_tokenだよ！")
        Alamofire.request(url, method:method, headers: headers).validate(statusCode: 200...299).responseJSON {
            response in
            switch response.result {
            case .success(let value):
                handler(JSON(value))
            default:
                break
            }
        }
    }
    
    static private func fullURL(endpoint: Endpoint) -> String {
        return baseUrl + endpoint.path()
    }
    
    static private func fullSpotifyURL(endpoint: Endpoint) -> String {
        return spotifyUrl + endpoint.path()
    }
}

enum Endpoint {
    case userProfile(Int)
    case userMicropost(Int)
    case createMicropost
    //Spotify Playlist
    case fetchTrack(String)
    
    func method() -> HTTPMethod {
        switch self {
        case .userProfile: return .get
        case .userMicropost: return .get
        case .createMicropost: return .post
        case .fetchTrack: return .get
        }
    }
    
    func path() -> String {
        switch self {
        case .userProfile(let value): return "/api/users/\(String(value))/profile"
        case .userMicropost(let value): return "/api/users/\(String(value))/microposts"
        case .createMicropost: return "/api/microposts/create"
        case .fetchTrack(let value): return "/playlists/\(String(value))/tracks?offset=0&limit=10&market=JP"
        }
    }
}
