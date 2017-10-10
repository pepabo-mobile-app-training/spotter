//
//  RailsAPI.swift
//  spotter
//
//  Created by futoshi.endo on 2017/10/06.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIClient {
    static private let baseUrl = "http://localhost:3000"
    
    static func request(endpoint: Endpoint, handler: @escaping (_ json: JSON) -> Void) {
        let method = endpoint.method()
        let url = fullURL(endpoint: endpoint)
        
        dump(method)
        dump(url)
        
        Alamofire.request(url, method:method).validate(statusCode: 200...299).responseJSON { response in
            switch response.result {
                
            case .success(let value):
//              ここで取得してきて値をいれている。
                handler(JSON(value))
//                dump(JSON(value))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    static private func fullURL(endpoint: Endpoint) -> String {
        return baseUrl + endpoint.path()
    }
}
    
enum Endpoint {
    case userProfile
    
    func method() -> HTTPMethod {
        switch self{
        case .userProfile: return .get
        }
    }
    
    func path() -> String {
        switch self{
        case .userProfile: return "/api/users/1/profile"
        }
    }
}

