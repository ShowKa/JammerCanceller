//
//  SafariExtensionViewController.swift
//  JammerCancellerExtension
//
//  Created by 金本翔太 on 2019/02/09.
//  Copyright © 2019 金本翔太. All rights reserved.
//

import SafariServices

class SafariExtensionViewController: SFSafariExtensionViewController {
    
    // instance
    static let shared = SafariExtensionViewController()

    // URL永続化Service
    let urlPersistence = UrlPersistence.shared
    
    // ----------------
    // View
    // ----------------
    // url table
    @IBOutlet weak var urlTable: NSTableView!
    
    // input
    @IBOutlet weak var urlTextField: NSTextField!
    
    // button
    @IBOutlet weak var addNewUrlButton: NSButton!
    
    // keep reference
    // otherwise, these will be deallocated
    var dataSource: UrlDataSource!
    var delegate: UrlTableViewDelegate!
    
    // ----------------
    // 画面初期設定
    // ----------------
    // 任意の引数を取る自作のイニシャライザ
    init() {
        // クラスの持つ指定イニシャライザを呼び出す
        super.init(nibName: nil, bundle: nil)
    }
    
    // 新しく init を定義した場合に必須
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) 未実装です・・・")
    }
    
    // view 構築
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlList = urlPersistence.getUrlList()
        self.dataSource = UrlDataSource(urlList:urlList)
        self.delegate = UrlTableViewDelegate(urlTable, self.dataSource)
        urlTable.dataSource = self.dataSource
        urlTable.delegate = self.delegate
    }
    
    // ----------------
    // 操作
    // ----------------
    // URL追加操作
    @IBAction func addNewUrl(_ sender: Any) {
        if let url = urlTextField.accessibilityValue() {
            // 0文字ならなにもしない。
            if (url.count == 0 ) {
                return
            }
            // add url
            self.delegate.addUrl(url)
            // reset textfield
            urlTextField.stringValue = ""
        }
    }
}
