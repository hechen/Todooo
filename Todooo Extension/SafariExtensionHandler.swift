//
//  SafariExtensionHandler.swift
//  Todooo Extension
//
//  Created by chen he on 2019/10/16.
//  Copyright © 2019 chen he. All rights reserved.
//

import SafariServices
import Utilities

class SafariExtensionHandler: SFSafariExtensionHandler {
    override func messageReceived(withName messageName: String, from page: SFSafariPage, userInfo: [String : Any]?) {
        // This method will be called when a content script provided by your extension calls
        // safari.extension.dispatchMessage("message").
    }
    
    override func toolbarItemClicked(in window: SFSafariWindow) {
        // This method will be called when your toolbar item is clicked.
        window.getActiveTab { tab in
            tab?.getActivePage { page in
                page?.getPropertiesWithCompletionHandler {
                    guard let properties = $0 else {
                        return
                    }
                    
                    let title = properties.title ?? ""
                    let urlString = properties.url?.absoluteString ?? ""
                    Defaults.activeTodoApp.addTodo(title, description: urlString)
                }
            }
        }
    }
    
    override func validateToolbarItem(in window: SFSafariWindow, validationHandler: @escaping ((Bool, String) -> Void)) {
        // This is called when Safari's state changed in some way that would require the extension's toolbar item to be validated again.
        validationHandler(true, "")
    }
    
    override func popoverViewController() -> SFSafariExtensionViewController {
        return SafariExtensionViewController.shared
    }
}
