//
//  Users.swift
//  spotter
//
//  Created by futoshi.endo on 2017/10/12.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import Foundation

class Users {
    var userID: Int
    var name: String
    var imgURL: URL
    
    init(name: String, imgURL: URL, userID: Int) {
        self.name = name
        self.imgURL = imgURL
        self.userID = userID
    }
    
    static func fetchUsers(userID: Int, handler: @escaping ((Users) -> Void)) {
        APIClient.request(endpoint: Endpoint.userProfile(userID)) { json in
            let users = Users(name: json["name"].stringValue, imgURL: (json["img_url"].url)!, userID: json["id"].intValue)
            return handler(users)
        }
    }
}
