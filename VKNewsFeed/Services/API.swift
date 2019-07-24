//
//  API.swift
//  VKNewsFeed
//
//  Created by MacBookPro on 23/06/2019.
//  Copyright © 2019 MacBookPro. All rights reserved.
//

import Foundation


struct API {
    static let scheme = "https"
    static let host = "api.vk.com"
    static let version = "5.100"
    
    static let newsFeed = "/method/newsfeed.get"
    static let user = "/method/users.get"
}
