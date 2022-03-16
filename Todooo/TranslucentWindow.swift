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
        
        super.init(contentRect: contentRect, styleMask: [.titled, .resizable, .closable], backing: .buffered, defer: false)
        
        self.contentView!.wantsLayer = true;
        self.isOpaque = false
        self.makeKeyAndOrderFront(nil)
        self.makeMain()
        
        if #available(macOS 11.0, *) {
            let isDark: Bool = NSAppearance.currentDrawing().bestMatch(from: [
                .aqua,
                .darkAqua
            ]) == .darkAqua
            self.appearance = NSAppearance(named: !isDark ? .vibrantLight : .vibrantDark)
            
        } else {
            // Fallback on earlier versions
            self.appearance = NSAppearance(named: .vibrantDark)
        }
  
        self.titlebarAppearsTransparent = true
        self.center()
        self.delegate = self
        
        let visualEffectView = NSVisualEffectView(frame: contentRect)
        visualEffectView.material = .contentBackground
        visualEffectView.blendingMode = .behindWindow
        visualEffectView.state = .active
        
        self.contentView?.addSubview(visualEffectView)
        
        self.contentView!.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[visualEffectView]-0-|", options: [.directionLeadingToTrailing], metrics: nil, views: ["visualEffectView":visualEffectView]))
        self.contentView!.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[visualEffectView]-0-|", options: [.directionLeadingToTrailing], metrics: nil, views: ["visualEffectView":visualEffectView]))
    }
    
    override func keyDown(with event: NSEvent) {
        if event.modifierFlags.contains(.command) {
            switch event.charactersIgnoringModifiers! {
            case "w":
                close()
            default:
                break
            }
        }
    }
}
