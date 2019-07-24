//
//  AuthViewCOntroller.swift
//  VKNewsFeed
//
//  Created by MacBookPro on 23/06/2019.
//  Copyright © 2019 MacBookPro. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    private var authService: AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //authService = AuthService()
        authService = AppDelegate.shared().authService
    }

    @IBAction func sighInTouch(_ sender: UIButton) {
        authService.wakeUpSession()
    }
}
