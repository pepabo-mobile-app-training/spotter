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
    
    static func request(endpoint: Endpoint, handler: @escaping (_ json: JSON) -> Void) {
        let method = endpoint.method()
        let url = fullURL(endpoint: endpoint)
        
        Alamofire.request(url, method:method).validate(statusCode: 200...299).responseJSON { response in
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
    
    func method() -> HTTPMethod {
        switch self{
        case .userProfile: return .get
        }
    }
    
    func path() -> String {
        switch self{
        case .userProfile(let value): return "/api/users/\(String(value))/profile"
        }
    }
}
