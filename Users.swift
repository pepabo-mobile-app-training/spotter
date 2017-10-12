//
//  Users.swift
//  spotter
//
//  Created by futoshi.endo on 2017/10/12.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import Foundation

class Users {
    var name: String
    var img_url: URL
    
    init(name: String, img_url: URL) {
        self.name = name
        self.img_url = img_url
    }
    
    static func fetchProfiles(handler: @escaping ((Users) -> Void)) {
        APIClient.request(endpoint: Endpoint.userProfile) { json in
            let profiles = Users(name: json["name"].stringValue,  img_url: (json["img_url"].url)!)
            return handler(profiles)
        }
    }
}
