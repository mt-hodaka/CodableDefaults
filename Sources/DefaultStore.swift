//
//  DefaultStore.swift
//  CodableDefaults
//
//  Created by hodaka fukushima on 2018/01/09.
//

import Foundation

public struct DefaultStore<ValueType: Codable> {
    private let key: String
    private let userDefaults: UserDefaults

    public init(forKey key: String, userDefaults: UserDefaults = UserDefaults.standard) {
        self.key = key
        self.userDefaults = userDefaults
    }

    public init(forKey key: String, defaultValue: ValueType, userDefaults: UserDefaults = UserDefaults.standard) {
        self.init(forKey: key, userDefaults: userDefaults)
        register(defaultValue: defaultValue)
    }

    private var decoder: JSONDecoder {
        return JSONDecoder()
    }

    private var encoder: JSONEncoder {
        return JSONEncoder()
    }

    private var isSwiftStandardLibraryType: Bool {
        switch ValueType.self {
        case is String.Type, is Bool.Type, is Float.Type, is Double.Type:
            return true
        case is Int.Type, is Int8.Type, is Int16.Type, is Int32.Type, is Int64.Type:
            return true
        case is UInt.Type, is UInt8.Type, is UInt16.Type, is UInt32.Type, is UInt64.Type:
            return true
        default:
            return false
        }
    }

    public func reset() {
        userDefaults.removeObject(forKey: key)
        userDefaults.synchronize()
    }

    public func get() -> ValueType? {
        if isSwiftStandardLibraryType {
            return userDefaults.value(forKey: key) as? ValueType
        }

        if case is Date.Type = ValueType.self {
            return userDefaults.value(forKey: key) as? ValueType
        }

        if case is URL.Type = ValueType.self {
            return userDefaults.url(forKey: key) as? ValueType
        }

        guard let data = userDefaults.data(forKey: key) else {
            return nil
        }

        do {
            return try decoder.decode(ValueType.self, from: data)
        } catch {
            assertionFailure("\(dump(error))")
            return nil
        }
    }

    public func set(_ value: ValueType) {
        if isSwiftStandardLibraryType {
            userDefaults.set(value, forKey: key)
            return
        }

        if case is Date.Type = ValueType.self {
            userDefaults.set(value, forKey: key)
            return
        }

        if case let url as URL = value {
            userDefaults.set(url, forKey: key)
            return
        }

        do {
            let encoded = try encoder.encode(value)
            userDefaults.set(encoded, forKey: key)
        } catch {
            assertionFailure("\(dump(error))")
        }
    }

    func register(defaultValue value: ValueType) {
        if isSwiftStandardLibraryType {
            userDefaults.register(defaults: [key: value])
            return
        }

        if case is Date.Type = ValueType.self {
            userDefaults.register(defaults: [key: value])
            return
        }

        if case is URL.Type = ValueType.self {
            userDefaults.register(defaults: [key: value])
            return
        }

        do {
            let encoded = try encoder.encode(value)
            userDefaults.register(defaults: [key: encoded])
        } catch {
            assertionFailure("\(dump(error))")
        }
    }
}
