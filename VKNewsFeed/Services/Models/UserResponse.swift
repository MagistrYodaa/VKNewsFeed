//
//  UserResponse.swift
//  VKNewsFeed
//
//  Created by MacBookPro on 22/07/2019.
//  Copyright © 2019 MacBookPro. All rights reserved.
//

import Foundation

struct UserResponseWrapped: Decodable {
    let response: [UserReponse]
}

struct UserReponse: Decodable {
    let photo100: String?
}
