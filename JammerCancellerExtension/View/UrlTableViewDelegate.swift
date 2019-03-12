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
        if tableColumn == tableView.tableColumns[0] {
            // url column
            if let cell = tableView.makeView(withIdentifier: CellID.Url, owner: nil) as? NSTableCellView {
                cell.textField?.stringValue = self.dataSource.urlList[row]
                return cell
            }
        } else if tableColumn == tableView.tableColumns[1] {
            // remove row button
            if let cell = tableView.makeView(withIdentifier: CellID.Remove, owner: nil ) as? NSTableCellView {
                NSLog("add remove button ----")
                let rect = NSRect(x: 0, y: 0, width: 15, height: 15)
                let button = NSButton(frame: rect)
                button.setButtonType(NSButton.ButtonType.momentaryPushIn)
                button.title = "-"
                button.tag = row
                cell.addSubview(button)
                cell.textField?.stringValue = ""
                return cell
            }
        }
        return nil
    }
}

fileprivate enum CellID {
    static let Url = NSUserInterfaceItemIdentifier("UrlCellID")
    static let Remove = NSUserInterfaceItemIdentifier("RemoveCellID")
}
