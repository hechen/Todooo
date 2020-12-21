//
//  TodoooWindowController.swift
//  Todooo
//
//  Created by chen he on 2020/8/19.
//  Copyright © 2020 chen he. All rights reserved.
//

import Cocoa

class TodoooWindowController: NSWindowController {
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    override func cancelOperation(_ sender: Any?) {
        self.close()
    }
}
