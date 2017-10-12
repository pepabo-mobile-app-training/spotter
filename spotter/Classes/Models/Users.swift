
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
    
    static func fetchProfiles(handler: @escaping ((Users) -> Void)) {
        APIClient.request(endpoint: Endpoint.userProfile(1)) { json in
            let profiles = Users(name: json["name"].stringValue, imgURL: (json["img_url"].url)!, userID: json["id"].intValue)
            return handler(profiles)
        }
    }
}
