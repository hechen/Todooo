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
    @IBOutlet weak var enableQuickEntry: NSButton!
    @IBOutlet weak var helpButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TodoApp.allCases.forEach {
            appListButton.addItem(withTitle: "\($0)")
        }
        appListButton.selectItem(at: Defaults.activeTodoAppIndex)
        enableQuickEntry.state = Defaults.quickEntryEnabled ? .on : .off
    }
    
    @IBAction func toggleQuickEntry(_ sender: NSButton) {
        Defaults.quickEntryEnabled = (sender.state == .on);
    }
    
    @IBAction func helpButtonClicked(_ sender: Any) {
        NSWorkspace.shared.open(URL(string: "https://heavyriver.notion.site/Todooo-50512fe824c945cbb14f8783ca1d9bf7")!)
    }
    
    @IBAction func openSafariExtensionPreferences(_ sender: AnyObject?) {
        SFSafariApplication.showPreferencesForExtension(withIdentifier: "app.chen.macos.Todooo.Extension") { error in
            if let _ = error {
                // Insert code to inform the user that something went wrong.
            }
        }
    }
        
    @IBAction func appListChooser(_ sender: NSPopUpButton) {
        Defaults.activeTodoAppIndex = sender.indexOfSelectedItem
    }
}
