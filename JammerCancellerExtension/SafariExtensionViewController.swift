//
//  SafariExtensionViewController.swift
//  JammerCancellerExtension
//
//  Created by 金本翔太 on 2019/02/09.
//  Copyright © 2019 金本翔太. All rights reserved.
//

import SafariServices

class SafariExtensionViewController: SFSafariExtensionViewController {
    
    static let shared = SafariExtensionViewController()
    
    // url table
    @IBOutlet weak var urlTable: NSTableView!
    
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
        NSLog("-----------------------call init-------------------------")
    }
    
    // 新しく init を定義した場合に必須
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) 未実装です・・・")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlValue : String = UserDefaults.standard.string(forKey: "url") ?? "default.com"
        NSLog("saved value = " + urlValue)
        self.dataSource = UrlDataSource(urlList:[urlValue, "www.fax.com"])
        self.delegate = UrlTableViewDelegate(self.dataSource)
        urlTable.dataSource = self.dataSource
        urlTable.delegate = self.delegate
        // urlTable.reloadData()
    }
    
    // ----------------
    // 操作
    // ----------------
    @IBAction func buttonClick(_ sender: Any) {
        NSLog("---------------popup button clicked---------------------")
        // UserDefaults.standard.set(url.accessibilityValue(), forKey: "url")
    }
}
