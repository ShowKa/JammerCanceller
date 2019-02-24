//
//  SafariExtensionService.swift
//  JammerCancellerExtension
//
//  Created by 金本翔太 on 2019/02/24.
//  Copyright © 2019 金本翔太. All rights reserved.
//

import Foundation

class SafariExtensionService {
    
    // instance
    static let shared = SafariExtensionService()
    
    func targetWebPage() -> Bool {
        // let url = self.getUrl()
        return true
    }
    
    func saveUrl(url:String) {
        UserDefaults.standard.set(url, forKey: "url")
    }
    
    func getUrl() -> String {
        return UserDefaults.standard.string(forKey: "url") ?? ""
    }
}
