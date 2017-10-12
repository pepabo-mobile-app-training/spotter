
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
    var imgURL: URL
    
    init(name: String, imgURL: URL) {
        self.name = name
        self.imgURL = imgURL
    }
    
    static func fetchProfiles(handler: @escaping ((Users) -> Void)) {
        APIClient.request(endpoint: Endpoint.userProfile) { json in
            let profiles = Users(name: json["name"].stringValue,  imgURL: (json["img_url"].url)!)
            return handler(profiles)
        }
    }
}
