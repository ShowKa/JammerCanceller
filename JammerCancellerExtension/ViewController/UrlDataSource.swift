//
//  DataSource.swift
//  JammerCancellerExtension
//
//  Created by 金本翔太 on 2019/03/09.
//  Copyright © 2019 金本翔太. All rights reserved.
//

import Foundation
import AppKit

class UrlDataSource : NSObject, NSTableViewDataSource {
    
    var urlList : [String]
    
    init(urlList : [String]) {
        self.urlList = urlList
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        NSLog("numberOfRow : " + String(self.urlList.count))
        return self.urlList.count
    }
    
    func addUrl(_ url: String) {
        self.urlList.append(url)
    }
    
    func removeUrl(at index: Int) {
        self.urlList.remove(at: index)
    }
    
    func get(at index: Int) -> String {
        return self.urlList[index]
    }
}
