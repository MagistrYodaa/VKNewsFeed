//
//  NewsFeedModels.swift
//  VKNewsFeed
//
//  Created by MacBookPro on 04/07/2019.
//  Copyright (c) 2019 MacBookPro. All rights reserved.
//

import UIKit

enum NewsFeed {
   
  enum Model {
    struct Request {
      enum RequestType {
        case getNewfeed
        case getUser
        case revealPostIds(postId: Int)
        case getNextbatch
      }
    }
    struct Response {
      enum ResponseType {
        case presentNewsFeed(feed: FeedResponse, revealdedPosIds: [Int])
        case presentUserInfo(user: UserReponse?)
        case presentFooterLoader
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case displayNewsFeed(feedViewModel: FeedViewModel)
        case displayUser(userViewModel: UserViewModel)
        case displayFooterLoader
      }
    }
  }
}

struct UserViewModel: TitleViewModel {
    var photoUrl: String?
}

struct FeedViewModel {
    struct Cell: FeedCellViewModel {
        var postId: Int
        
        var iconUrlString: String
        var name: String
        var date: String
        var text: String?
        var likes: String?
        var comments: String?
        var shares: String?
        var views: String?
        var sizes: FeedCellSizes
        var photoAttachments: [FeedCellPhotoAttachmentViewModel]
    }
    
    struct FeedCellPhotoAttachment: FeedCellPhotoAttachmentViewModel {
        var photoUrlString: String?
        var width: Int
        var height: Int
    }
    
    let cells: [Cell]
}
