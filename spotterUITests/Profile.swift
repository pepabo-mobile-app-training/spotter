//
//  Profile.swift
//  spotter
//
//  Created by futoshi.endo on 2017/10/06.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import Foundation

class Profile {
    var name: String
    var img_url: URL
    
    init(name: String, img_url: URL) {
        self.name = name
        self.img_url = img_url
    }
    
    static func fetchProfiles(handler: @escaping ((Profile) -> Void)) {
        APIClient.request(endpoint: Endpoint.userProfile) { json in
            let profiles = Profile(name: json["name"].stringValue,  img_url: (json["img_url"].url)!)
            handler(profiles)
        }
    }
}
