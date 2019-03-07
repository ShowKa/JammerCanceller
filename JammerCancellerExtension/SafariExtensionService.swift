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
    
    func targetWebPage(webPageUrl url: String) -> Bool {
        let _target = self.getUrl()
        NSLog(_target)
        NSLog(url)
        return url.matches(_target)
    }
    
    func getRandomMessage() -> String {
        let list = getMessageList();
        let index = Int.random(range: 0..<list.count)
        return list[index];
    }
    
    func saveUrl(url:String) {
        UserDefaults.standard.set(url, forKey: "url")
    }
    
    func getUrl() -> String {
        return UserDefaults.standard.string(forKey: "url") ?? ""
    }
    
    // message list from Message.plist
    private func getMessageList() -> [String] {
        var myEnglishArray: [String] = []
        if let URL = Bundle.main.url(forResource: "Message", withExtension: "plist") {
            guard let englishFromPlist = NSDictionary(contentsOf: URL) else { return [] }
            if let englishArray = englishFromPlist.value(forKey: "message") as? [String] {
                for myEnglish in englishArray {
                    myEnglishArray.append(myEnglish)
                }
            }
        }
        return myEnglishArray
    }
}

