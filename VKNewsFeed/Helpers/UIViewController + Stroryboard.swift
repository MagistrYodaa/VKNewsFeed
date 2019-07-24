//
//  UIViewController + Stroryboard.swift
//  VKNewsFeed
//
//  Created by MacBookPro on 23/06/2019.
//  Copyright © 2019 MacBookPro. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    class func loadFromStoryBoard<T: UIViewController>() -> T {
        let name = String(describing: T.self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        if let viewController = storyboard.instantiateInitialViewController() as? T {
            return viewController
        } else {
            fatalError("Error: No inital view controller in \(name) storyboard!")
        }
    }
}
