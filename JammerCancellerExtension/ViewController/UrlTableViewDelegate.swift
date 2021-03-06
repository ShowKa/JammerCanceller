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
        if tableColumn == tableView.tableColumns[0] {
            // url column
            if let cell = tableView.makeView(withIdentifier: CellID.Url, owner: nil) as? NSTableCellView {
                cell.textField?.stringValue = self.dataSource.get(at: row)
                return cell
            }
        } else if tableColumn == tableView.tableColumns[1] {
            // remove row button
            if let cell = tableView.makeView(withIdentifier: CellID.Remove, owner: nil ) as? NSTableCellView {
                // button to cell
                let w = cell.frame.width
                let h = cell.frame.height
                let rect = CGRect(x: 0, y: 0, width: w, height: h)
                let rmButton = RemoveButton(frame: rect)
                rmButton.setRow(row)
                rmButton.setAction(self, #selector(self.removeUrl(_:)))
                cell.addSubview(rmButton)
                // clear
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
