//
//  TranparentWindow.swift
//  Todooo
//
//  Created by chen on 2020/12/17.
//  Copyright © 2020 chen he. All rights reserved.
//

import Cocoa

class TranslucentWindow: NSWindow, NSApplicationDelegate, NSWindowDelegate{
    override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
        
        super.init(contentRect: contentRect, styleMask: [
            .titled, .resizable, .closable
        ], backing: .buffered, defer: false)
        
        self.contentView!.wantsLayer = true;/*this can and is set in the view*/
        self.isOpaque = false
        self.makeKeyAndOrderFront(nil)
        self.makeMain()
        
        self.appearance = NSAppearance(named: .vibrantDark)
        self.titlebarAppearsTransparent = true
        self.center()
        self.delegate = self
        
        let visualEffectView = NSVisualEffectView(frame: contentRect)
        visualEffectView.material = .appearanceBased
        visualEffectView.blendingMode = .behindWindow
        visualEffectView.state = .active
        
        self.contentView?.addSubview(visualEffectView)
        
        self.contentView!.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[visualEffectView]-0-|", options: [.directionLeadingToTrailing], metrics: nil, views: ["visualEffectView":visualEffectView]))
        self.contentView!.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[visualEffectView]-0-|", options: [.directionLeadingToTrailing], metrics: nil, views: ["visualEffectView":visualEffectView]))
    }
}
