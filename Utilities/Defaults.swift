//
//  UserDefaults+.swift
//  Todooo Extension
//
//  Created by chen he on 2020/1/9.
//  Copyright © 2020 chen he. All rights reserved.
//

import Foundation

public enum DefaultsKey: String {
    case activeTodo = "app.chen.macos.todo.active"
    case globalShortcut = "app.chen.macos.todo.globalshortcut"
}
protocol KeyValueStoreType: AnyObject {
    func set(_ value: Int, forKey defaultName: String)
    func integer(forKey defaultName: String) -> Int

    func removeObject(forKey defaultName: String)
    
    var activeTodo: Int { get set }
}
extension KeyValueStoreType {
    public var activeTodo: Int {
        get {
            return self.integer(forKey: DefaultsKey.activeTodo.rawValue)
        }
        set {
            self.set(newValue, forKey: DefaultsKey.activeTodo.rawValue)
        }
    }
}
extension UserDefaults: KeyValueStoreType { }


public struct Defaults {
    private static let userDefaults = UserDefaults(suiteName: "group.app.chen.macos.Todooo")
    public static var activeTodoAppIndex: Int {
        get {
            return userDefaults?.activeTodo ?? 0
        }
        set {
            userDefaults?.activeTodo = newValue
        }
    }
}
