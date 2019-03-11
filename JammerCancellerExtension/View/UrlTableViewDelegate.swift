//
//  UrlTableViewDelegate.swift
//  JammerCancellerExtension
//
//  Created by 金本翔太 on 2019/03/09.
//  Copyright © 2019 金本翔太. All rights reserved.
//

import Foundation
import AppKit

class UrlTableViewDelegate : NSObject, NSTableViewDelegate {

    
    let dataSource : UrlDataSource
    
    init(_ dataSource: UrlDataSource) {
        self.dataSource = dataSource
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        NSLog("tableView -> NSView 行番号 : " + String(row))
        if let cell = tableView.makeView(withIdentifier: CellID.Url, owner: nil) as? NSTableCellView {
            cell.textField?.stringValue = self.dataSource.urlList[row]
            return cell
        }
        return nil
    }
}

fileprivate enum CellID {
    static let Url = NSUserInterfaceItemIdentifier("UrlCellID")
}
