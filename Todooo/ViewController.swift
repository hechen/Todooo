//
//  ViewController.swift
//  Todooo
//
//  Created by chen he on 2019/10/16.
//  Copyright © 2019 chen he. All rights reserved.
//

import Cocoa
import SafariServices.SFSafariApplication
import Utilities

class ViewController: NSViewController {
    
    @IBOutlet weak var appListButton: NSPopUpButton!
    @IBOutlet weak var activateButton: NSButton!
    
    @IBOutlet weak var enableQuickEntry: ITSwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = NSColor.systemGray
        
        // prepare data
        TodoApp.allCases.forEach {
            appListButton.addItem(withTitle: "\($0)")
        }
        appListButton.selectItem(at: Defaults.activeTodoAppIndex)
        enableQuickEntry.checked = Defaults.quickEntryEnabled    }
    
    @IBAction func toggleQuickEntry(_ sender: ITSwitch!) {        
        Defaults.quickEntryEnabled = sender.checked
    }
    
    @IBAction func openSafariExtensionPreferences(_ sender: AnyObject?) {
        SFSafariApplication.showPreferencesForExtension(withIdentifier: "app.chen.macos.Todooo-Extension") { error in
            if let _ = error {
                // Insert code to inform the user that something went wrong.
            }
        }
    }
        
    @IBAction func appListChooser(_ sender: NSPopUpButton) {
        Defaults.activeTodoAppIndex = sender.indexOfSelectedItem
    }
}
