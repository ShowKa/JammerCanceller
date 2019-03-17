//
//  RemoveButton.swift
//  JammerCancellerExtension
//
//  Created by 金本翔太 on 2019/03/17.
//  Copyright © 2019 金本翔太. All rights reserved.
//

import Cocoa

class RemoveButton: NSView {

    @IBOutlet var button: NSButton!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        loadNib()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    private func loadNib() {
        var topLevelObjects : NSArray?
        let nibName = NSNib.Name("RemoveButton")
        if Bundle.main.loadNibNamed(nibName, owner: self, topLevelObjects: &topLevelObjects) {
            var views : [NSView] = []
            topLevelObjects?.forEach({ (v) in
                if (v is NSView) {
                    views.append(v as! NSView)
                }
            })
            let view = views[0]
            view.frame = self.bounds
            self.addSubview(view)
        } else {
            // error?
        }
    }
}

// button function
extension RemoveButton {
    
    func setRow(_ row: Int) {
        button.tag = row
    }
    
    func setAction(_ target: NSObject, _ action: Selector) {
        button.target = target
        button.action = action
    }
    
}
