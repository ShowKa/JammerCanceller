//
//  SafariExtensionViewController.swift
//  JammerCancellerExtension
//
//  Created by 金本翔太 on 2019/02/09.
//  Copyright © 2019 金本翔太. All rights reserved.
//

import SafariServices

class SafariExtensionViewController: SFSafariExtensionViewController {
    
    static let shared = SafariExtensionViewController()

    @IBAction func buttonClick(_ sender: Any) {
        NSLog("---------------popup button clicked---------------------")
    }
    
    @IBAction func inputUrl(_ sender: Any) {
        NSLog("---------------input url--------------------------------")
    }
}
