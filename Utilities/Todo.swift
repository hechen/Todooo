//
//  Todo.swift
//  Todooo Extension
//
//  Created by chen he on 2019/10/16.
//  Copyright © 2019 chen he. All rights reserved.
//

import Foundation
import AppKit

public enum TodoApp: Int, CaseIterable {
    case omnifocus = 0
    case things
    case twodo
}
extension TodoApp: CustomStringConvertible {
    public var description: String {
        switch self {
        case .omnifocus:
            return "Omnifocus"
        case .things:
            return "Things"
        case .twodo:
            return "2Do"
        }
    }
}

extension TodoApp {
    public func addTodo(_ title: String, description: String = "") {
        var urlString: String = ""
        switch self {
        
        case .omnifocus:
            // omnifocus:///add?name=Pick%20up%20milk&note=You%20gotta
            // autosave=true 意味着不显示
            urlString = "omnifocus:///add?"
            urlString += "name=\(title.urlEncoded ?? "")"
            if description.isNotEmpty {
                urlString += "&note=\(description.urlEncoded ?? "")"
            }
            if !Defaults.quickEntryEnabled {
                urlString += "&autosave=true"
            }
            
        case .things:
            // detail at: https://culturedcode.com/things/support/articles/2803573/
            // things:///add?title=A%20new%20task&notes=It's%20an%20URL%3A%20http%3A%2F%2Fjira.in.zhihu.com%2Fbrowse%2FMP-2749
            urlString = "things:///add?"
            urlString += "title=\(title.urlEncoded ?? "")"
            if description.isNotEmpty {
                urlString += "&notes=\(description.urlEncoded ?? "")"
            }
            urlString += "&quick-entry=\(Defaults.quickEntryEnabled ? "true" : "false")"
            
        case .twodo:
            // detail at: https://www.2doapp.com/kb/article/url-schemes.html
            // twodo://x-callback-url/add?task=[prompt:Text]&note=[prompt:Notes]
            urlString += "twodo://x-callback-url/add?"
            urlString += "task=\(title.urlEncoded ?? "")"
            if description.isNotEmpty {
                urlString += "&note=\(description.urlEncoded ?? "")"
                // add action for 2Do
                let action = "url:" + description
                urlString += "&action=\(action.urlEncoded ?? "")"
            }
        }
        if urlString.isNotEmpty, let url = URL(string: urlString) {
            NSWorkspace.shared.open(url)
        }
    }
}


extension Defaults {
    public static var activeTodoApp: TodoApp {
        set {
            activeTodoAppIndex = newValue.rawValue
        }
        get {
            return TodoApp(rawValue: activeTodoAppIndex) ?? .omnifocus
        }
    }
}
