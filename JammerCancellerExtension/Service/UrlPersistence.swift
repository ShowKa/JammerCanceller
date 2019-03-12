//
//  UrlPersistence.swift
//  JammerCancellerExtension
//
//  Created by 金本翔太 on 2019/03/12.
//  Copyright © 2019 金本翔太. All rights reserved.
//

import Foundation

class UrlPersistence {
    
    // instance
    static let shared = UrlPersistence()
    
    // key for UserDefaults
    private let key = "urlList"
    
    // save new url to list
    func saveNewUrl(_ url: String) {
        var urlList = self.getUrlList()
        urlList.append(url)
        UserDefaults.standard.set(urlList, forKey: key)
    }
    
    // get url list
    func getUrlList() -> [String] {
        let _urlList = UserDefaults.standard.array(forKey: key)
        var returnList : [String] = []
        if let urlList = _urlList {
            urlList.forEach {
                if let url = $0 as? String {
                    returnList.append(url)
                }
            }
        }
        return returnList
    }
}
