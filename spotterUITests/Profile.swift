//
//  Profile.swift
//  spotter
//
//  Created by futoshi.endo on 2017/10/06.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import Foundation

class Profile {
    var id: Int
    var name: String
    var img_url: String
    
    init(id:Int, name: String, img_url: String) {
        self.id = id
        self.name = name
        self.img_url = img_url
    }
    
    static func fetchProfiles(handler: @escaping ((Array<Profile>) -> Void)) {
        APIClient.request(endpoint: Endpoint.Index) { json in
            let profiles = json["data"].arrayValue.map {
                Profile(id: $0["id"].intValue, name: $0["name"].stringValue,  img_url: $0["img_url"].stringValue)
            }
            handler(profiles)
        }
    }
    
}
