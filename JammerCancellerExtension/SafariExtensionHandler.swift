//
//  SafariExtensionHandler.swift
//  JammerCancellerExtension
//
//  Created by 金本翔太 on 2019/02/09.
//  Copyright © 2019 金本翔太. All rights reserved.
//

import SafariServices

class SafariExtensionHandler: SFSafariExtensionHandler {
    
    // call service like DI (Not DI...)
    let service = SafariExtensionService.shared
    
    override func messageReceived(withName messageName: String, from page: SFSafariPage, userInfo: [String : Any]?) {
        // This method will be called when a content script provided by your extension calls safari.extension.dispatchMessage("message").
        page.getPropertiesWithCompletionHandler { properties in
            NSLog("The extension received a message (\(messageName)) from a script injected into (\(String(describing: properties?.url))) with userInfo (\(userInfo ?? [:]))")
            // call service
            switch messageName {
            case "execute?":
                if let url = properties?.url {
                    let targetWebPage = self.service.targetWebPage(webPageUrl: url.absoluteString)
                    if targetWebPage {
                        // do it
                        NSLog("DoIt")
                        let message = self.service.getRandomString()
                        page.dispatchMessageToScript(withName: "DoIt", userInfo: ["message" : message])
                    }
                } else {
                    NSLog("No URL!!!!")
                }
                break
            default:
                NSLog("--- Unknown message : " + messageName + " ---")
                break
            }
        }
    }
    
    override func toolbarItemClicked(in window: SFSafariWindow) {
        // This method will be called when your toolbar item is clicked.
        NSLog("The extension's toolbar item was clicked")
    }
    
    override func validateToolbarItem(in window: SFSafariWindow, validationHandler: @escaping ((Bool, String) -> Void)) {
        // This is called when Safari's state changed in some way that would require the extension's toolbar item to be validated again.
        validationHandler(true, "")
    }
    
    override func popoverViewController() -> SFSafariExtensionViewController {
        return SafariExtensionViewController.shared
    }

}
