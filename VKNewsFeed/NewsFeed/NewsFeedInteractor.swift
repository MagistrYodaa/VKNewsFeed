//
//  NewsFeedInteractor.swift
//  VKNewsFeed
//
//  Created by MacBookPro on 04/07/2019.
//  Copyright (c) 2019 MacBookPro. All rights reserved.
//

import UIKit

protocol NewsFeedBusinessLogic {
  func makeRequest(request: NewsFeed.Model.Request.RequestType)
}

class NewsFeedInteractor: NewsFeedBusinessLogic {

  var presenter: NewsFeedPresentationLogic?
  var service: NewsFeedService?
  
  func makeRequest(request: NewsFeed.Model.Request.RequestType) {
    if service == nil {
      service = NewsFeedService()
    }
    
    switch request {
        
    case .getNewfeed:
        service?.getFeed(completion: { [weak self] (revealedPostIds, feed) in
            self?.presenter?.presentData(response: .presentNewsFeed(feed: feed, revealdedPosIds: revealedPostIds))
        })
        
    case .getUser:
        service?.getUser(completion: { [weak self] (user) in
            self?.presenter?.presentData(response: .presentUserInfo(user: user))
        })
        
    case .revealPostIds(let postId):
        service?.revealPostIds(forPostId: postId, completion: { [weak self] (revealedPostIds, feed) in
            self?.presenter?.presentData(response: .presentNewsFeed(feed: feed, revealdedPosIds: revealedPostIds))
        })
        
    case .getNextbatch:
        self.presenter?.presentData(response: .presentFooterLoader)
        service?.getNextBatch(completion: { [weak self] (revealedPostIds, feed) in
            self?.presenter?.presentData(response: .presentNewsFeed(feed: feed, revealdedPosIds: revealedPostIds))
        })
    }
    
    
  }
}
