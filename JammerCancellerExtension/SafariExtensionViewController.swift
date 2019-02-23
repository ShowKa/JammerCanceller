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

    @IBOutlet weak var url: NSTextField!
    
    // 任意の引数を取る自作のイニシャライザ
    init() {
        // クラスの持つ指定イニシャライザを呼び出す
        super.init(nibName: nil, bundle: nil)
        NSLog("-----------------------call init-------------------------")
        //let urlValue = UserDefaults.standard.string(forKey: "url")
    }
    
    // 新しく init を定義した場合に必須
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) 未実装です・・・")
    }
    
    @IBAction func buttonClick(_ sender: Any) {
        NSLog("---------------popup button clicked---------------------")
        UserDefaults.standard.set(url.accessibilityValue(), forKey: "url")
    }
    
    @IBAction func inputUrl(_ sender: Any) {
        NSLog("---------------input url--------------------------------")
        NSLog(url.accessibilityValue()!)
    }
}
