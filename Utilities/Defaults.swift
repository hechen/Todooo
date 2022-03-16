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
    case enableQuickEntry = "app.chen.maxos.todo.quickentry"
    case globalShortcut = "app.chen.macos.todo.globalshortcut"
}
protocol KeyValueStoreType: AnyObject {
    func set(_ value: Int, forKey defaultName: String)
    func integer(forKey defaultName: String) -> Int
    func set(_ value: Bool, forKey defaultName: String)
    func bool(forKey defaultName: String) -> Bool

    func removeObject(forKey defaultName: String)
    
    var activeTodo: Int { get set }
}
extension KeyValueStoreType {
    public var activeTodo: Int {
        get { integer(forKey: DefaultsKey.activeTodo.rawValue) }
        set { set(newValue, forKey: DefaultsKey.activeTodo.rawValue) }
    }
    public var quickEntry: Bool {
        get { bool(forKey: DefaultsKey.enableQuickEntry.rawValue) }
        set { set(newValue, forKey: DefaultsKey.enableQuickEntry.rawValue)}
    }
}
extension UserDefaults: KeyValueStoreType { }


public struct Defaults {
    private static let userDefaults = UserDefaults(suiteName: "group.app.chen.macos.Todooo")
    public static var activeTodoAppIndex: Int {
        get { userDefaults?.activeTodo ?? 0 }
        set { userDefaults?.activeTodo = newValue }
    }
    public static var quickEntryEnabled: Bool {
        get { userDefaults?.quickEntry ?? true }
        set { userDefaults?.quickEntry = newValue }
    }
}
