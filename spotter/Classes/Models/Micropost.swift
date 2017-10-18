//
//  Micropost.swift
//  spotter
//
//  Created by futoshi.endo on 2017/10/13.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import Foundation
import SwiftyJSON

class Micropost {
    var id = 0
    var userID: Int
    var content: String
    
    init(userID: Int, content: String) {
        self.userID = userID
        self.content = content
    }

    static func jsonToMicroposts(_ json: JSON) -> Array<Micropost> {
        return json["microposts"].arrayValue.map {
            Micropost(userID: $0["user_id"].intValue, content: $0["content"].stringValue)
        }
    }
    
    static func fetchMicroposts(userID: Int, handler: @escaping ((Array<Micropost>) -> Void)) {
        APIClient.request(endpoint: Endpoint.userMicropost(userID)) { json in
            return handler(jsonToMicroposts(json))
        }
    }
    
    static func pushMicropost(userID: Int, content: String, handler: @escaping ((Micropost) -> Void)) {
        let params: [String:Any] = [
            "user_id": userID,
            "micropost": ["content": content]
        ]
        APIClient.request(endpoint: Endpoint.createMicropost, params: params) { json in
            let pushedMicropost = Micropost(userID: json["micropost"]["user_id"].intValue, content: json["micropost"]["content"].stringValue)
            return handler(pushedMicropost)
        }
    }
}
