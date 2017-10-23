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
    
    static private func fullURL(endpoint: Endpoint) -> String {
        return baseUrl + endpoint.path()
    }
}

enum Endpoint {
    case userProfile(Int)
    case userMicropost(Int)
    case createMicropost
    
    func method() -> HTTPMethod {
        switch self {
        case .userProfile: return .get
        case .userMicropost: return .get
        case .createMicropost: return .post
        }
    }
    
    func path() -> String {
        switch self {
        case .userProfile(let value): return "/api/users/\(String(value))/profile"
        case .userMicropost(let value): return "/api/users/\(String(value))/microposts"
        case .createMicropost: return "/api/microposts/create"
        }
    }
}

func spotifyGetPlaylist(OathToken: String, playlistID: String) {
    let headers: HTTPHeaders = [
        "Authorization": "Bearer  \(String(OathToken))"
    ]
    
    Alamofire.request( "https://api.spotify.com/v1/users/kurukuru5284/playlists/\(String(playlistID))/tracks?offset=0&limit=10&market=JP", headers: headers).responseJSON {
        response in
        switch response.result {
        case .success(let value):
            dump(JSON(value))
        default:
            break
        }
    }
}

