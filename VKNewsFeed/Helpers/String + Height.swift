//
//  String + Height.swift
//  VKNewsFeed
//
//  Created by MacBookPro on 09/07/2019.
//  Copyright © 2019 MacBookPro. All rights reserved.
//

import Foundation
import UIKit


extension String {
    
    func height(width: CGFloat, font: UIFont) -> CGFloat {
        let textSize = CGSize(width: width, height: .greatestFiniteMagnitude)
        
        let size = self.boundingRect(with: textSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : font], context: nil)
        
        return ceil(size.height)
    }
}
