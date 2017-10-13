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
    var userID: Int
    var content: String
    
    init(userID: Int, content: String) {
        self.userID = userID
        self.content = content
    }

    static func MicropostsToJSON(_ json: JSON) -> Array<Micropost> {
        return json["microposts"].arrayValue.map {
            Micropost(userID: $0["user_id"].intValue, content: $0["content"].stringValue)
        }
    }
    
    static func fetchMicropost(userID: Int, handler: @escaping ((Array<Micropost>) -> Void)) {
        APIClient.request(endpoint: Endpoint.userMicropost(userID)) { json in
            return handler(MicropostsToJSON(json))
        }
    }
}
