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

    // Table
    let tableView : NSTableView
    
    // DataSource
    let dataSource : UrlDataSource
    
    // URL永続化Service
    let urlPersistence = UrlPersistence.shared
    
    // init
    init(_ tableView: NSTableView, _ dataSource: UrlDataSource) {
        self.tableView = tableView
        self.dataSource = dataSource
    }
    
    // add URL
    func addUrl(_ url: String) {
        dataSource.addUrl(url)
        urlPersistence.saveNewUrl(url)
        self.tableView.reloadData()
    }
    
    // remove url
    func removeUrl(at index: Int) {
        dataSource.removeUrl(at: index)
        urlPersistence.remove(at: index)
        self.tableView.reloadData()
    }
}

extension UrlTableViewDelegate {
    // make TableCells
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        NSLog("tableView -> NSView 行番号 : " + String(row))
        if tableColumn == tableView.tableColumns[0] {
            // url column
            if let cell = tableView.makeView(withIdentifier: CellID.Url, owner: nil) as? NSTableCellView {
                cell.textField?.stringValue = self.dataSource.get(at: row)
                return cell
            }
        } else if tableColumn == tableView.tableColumns[1] {
            // remove row button
            if let cell = tableView.makeView(withIdentifier: CellID.Remove, owner: nil ) as? NSTableCellView {
                NSLog("add remove button ----")
                let button = NSButton(title: "ー", target: self, action: #selector(self.removeUrl(_:)))
                // let rect = NSRect(x: 0, y: 0, width: 15, height: 15)
                let position = NSPoint(x:0, y:0)
                let size = NSSize(width: 30, height: 30)
                button.setFrameOrigin(position)
                button.setFrameSize(size)
                button.setButtonType(NSButton.ButtonType.momentaryPushIn)
                button.tag = row
                // button to cell
                cell.addSubview(button)
                cell.textField?.stringValue = ""
                return cell
            }
        }
        return nil
    }
    
    // click remove button
    @objc func removeUrl(_ sender: NSButton) {
        self.removeUrl(at: sender.tag)
    }
}

fileprivate enum CellID {
    static let Url = NSUserInterfaceItemIdentifier("UrlCellID")
    static let Remove = NSUserInterfaceItemIdentifier("RemoveCellID")
}
