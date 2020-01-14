//
//  NSView+Color.swift
//  Todooo Extension
//
//  Created by chen he on 2020/1/13.
//  Copyright © 2020 chen he. All rights reserved.
//

import Cocoa

extension NSView {
    public var backgroundColor: NSColor? {
        set {
            if let backgroundColor = newValue {
                wantsLayer = true
                layer?.backgroundColor = backgroundColor.cgColor
            } else {
                wantsLayer = false
                layer?.backgroundColor = nil
            }
        }
        get {
            guard let cgColor = layer?.backgroundColor else {
                return nil
            }
            return NSColor(cgColor: cgColor)
        }
    }
}
