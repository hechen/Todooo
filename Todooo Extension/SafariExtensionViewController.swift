//
//  SafariExtensionViewController.swift
//  Todooo Extension
//
//  Created by chen he on 2019/10/16.
//  Copyright © 2019 chen he. All rights reserved.
//

import SafariServices

class SafariExtensionViewController: SFSafariExtensionViewController {
    
    static let shared: SafariExtensionViewController = {
        let shared = SafariExtensionViewController()
        shared.preferredContentSize = NSSize(width:320, height:240)
        return shared
    }()

}
