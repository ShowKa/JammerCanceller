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
    
    // URL永続化Service
    let urlPersistence = UrlPersistence.shared
    
    // 対象URL検証
    func targetWebPage(webPageUrl url: String) -> Bool {
        let targets = self.urlPersistence.getUrlList()
        var matched = false
        targets.forEach { (target) in
            if (url.matches(target)) {
                matched = true
            }
        }
        return matched
    }
    
    // ランダムメッセージ取得
    func getRandomMessage() -> String {
        let list = getMessageList();
        let index = Int.random(range: 0..<list.count)
        return list[index];
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

