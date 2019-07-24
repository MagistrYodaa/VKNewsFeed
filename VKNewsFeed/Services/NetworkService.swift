//
//  NetworkService.swift
//  VKNewsFeed
//
//  Created by MacBookPro on 23/06/2019.
//  Copyright © 2019 MacBookPro. All rights reserved.
//

import Foundation

protocol Networking {
    func request(path: String, params: [String:String], completion: @escaping (Data?, Error?) -> Void)
}

final class NetworkService: Networking {
    private let authService: AuthService
    
    init(authService: AuthService = AppDelegate.shared().authService) {
        self.authService = authService
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask{
        return URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        })
    }
    
    private func url(from path: String, params: [String:String]) -> URL {
        var components = URLComponents()
        
        components.scheme = API.scheme
        components.host = API.host
        components.path = path
        components.queryItems = params.map({ URLQueryItem(name: $0, value: $1) })
        
        return components.url!
    }
    
    func request(path: String, params: [String : String], completion: @escaping (Data?, Error?) -> Void) {
        guard let token = authService.token  else { return }
        var allparams = params
        allparams["access_token"] = token
        allparams["v"] = API.version
        let url = self.url(from: path, params: allparams)
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completion: completion)
        task.resume()
        print(url)
    }
}
