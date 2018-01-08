//
//  DefaultStoreTests.swift
//  CodableDefaultsTests
//
//  Created by hodaka fukushima on 2018/01/09.
//

import XCTest
@testable import CodableDefaults

class DefaultStoreTests: XCTestCase {
    
    let key = "key"
    
    override func setUp() {
        super.setUp()
        
        UserDefaults.standard.removeObject(forKey: key)
        
        /// reset registered value by `NSUserDefaults.register(defaults:)`.
        var registrationDomain = UserDefaults.standard.volatileDomain(forName: UserDefaults.registrationDomain)
        registrationDomain.removeValue(forKey: key)
        UserDefaults.standard.setVolatileDomain(registrationDomain, forName: UserDefaults.registrationDomain)
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testString() {
        let store = DefaultStore<String>(forKey: key)
        
        let value = "string"
        store.set(value)
        
        let saved = store.get()
        XCTAssertEqual(saved, value)
        
        store.reset()
        XCTAssertNil(store.get())
    }
    
    func testBool() {
        let store = DefaultStore<Bool>(forKey: key)
        
        let value = true
        store.set(value)
        
        let saved = store.get()
        XCTAssertEqual(saved, value)
        
        store.reset()
        XCTAssertNil(store.get())
    }
    
    func testInt() {
        let store = DefaultStore<Int>(forKey: key)
        
        let value = Int.max
        store.set(value)
        
        let saved = store.get()
        XCTAssertEqual(saved, value)
        
        store.reset()
        XCTAssertNil(store.get())
    }
    
    func testInt8() {
        let store = DefaultStore<Int8>(forKey: key)
        
        let value = Int8.max
        store.set(value)
        
        let saved = store.get()
        XCTAssertEqual(saved, value)
        
        store.reset()
        XCTAssertNil(store.get())
    }
    
    func testInt16() {
        let store = DefaultStore<Int16>(forKey: key)
        
        let value = Int16.max
        store.set(value)
        
        let saved = store.get()
        XCTAssertEqual(saved, value)
        
        store.reset()
        XCTAssertNil(store.get())
    }
    
    func testInt32() {
        let store = DefaultStore<Int32>(forKey: key)
        
        let value = Int32.max
        store.set(value)
        
        let saved = store.get()
        XCTAssertEqual(saved, value)
        
        store.reset()
        XCTAssertNil(store.get())
    }
    
    func testInt64() {
        let store = DefaultStore<Int64>(forKey: key)
        
        let value = Int64.max
        store.set(value)
        
        let saved = store.get()
        XCTAssertEqual(saved, value)
        
        store.reset()
        XCTAssertNil(store.get())
    }
    
    func testUInt() {
        let store = DefaultStore<UInt>(forKey: key)
        
        let value = UInt.max
        store.set(value)
        
        let saved = store.get()
        XCTAssertEqual(saved, value)
        
        store.reset()
        XCTAssertNil(store.get())
    }
    
    func testUInt8() {
        let store = DefaultStore<UInt8>(forKey: key)
        
        let value = UInt8.max
        store.set(value)
        
        let saved = store.get()
        XCTAssertEqual(saved, value)
        
        store.reset()
        XCTAssertNil(store.get())
    }
    
    func testUInt16() {
        let store = DefaultStore<UInt16>(forKey: key)
        
        let value = UInt16.max
        store.set(value)
        
        let saved = store.get()
        XCTAssertEqual(saved, value)
        
        store.reset()
        XCTAssertNil(store.get())
    }
    
    func testUInt32() {
        let store = DefaultStore<UInt32>(forKey: key)
        
        let value = UInt32.max
        store.set(value)
        
        let saved = store.get()
        XCTAssertEqual(saved, value)
        
        store.reset()
        XCTAssertNil(store.get())
    }
    
    func testUInt64() {
        let store = DefaultStore<UInt64>(forKey: key)
        
        let value = UInt64.max
        store.set(value)
        
        let saved = store.get()
        XCTAssertEqual(saved, value)
        
        store.reset()
        XCTAssertNil(store.get())
    }
    
    func testFloat() {
        let store = DefaultStore<Float>(forKey: key)
        
        let value: Float = 123.456789
        store.set(value)
        
        let saved = store.get()
        XCTAssertEqual(saved, value)
        
        store.reset()
        XCTAssertNil(store.get())
    }
    
    func testDouble() {
        let store = DefaultStore<Double>(forKey: key)
        
        let value = 123.456789
        store.set(value)
        
        let saved = store.get()
        XCTAssertEqual(saved, value)
        
        store.reset()
        XCTAssertNil(store.get())
    }
    
    func testDate() {
        let store = DefaultStore<Date>(forKey: key)
        
        let value = Date()
        store.set(value)
        
        let saved = store.get()
        XCTAssertEqual(saved, value)
        
        store.reset()
        XCTAssertNil(store.get())
    }
    
    func testURL() {
        let store = DefaultStore<URL>(forKey: key)
        
        let value = URL(string: "https://www.apple.com/")!
        store.set(value)
        
        let saved = store.get()
        XCTAssertEqual(saved, value)
        
        store.reset()
        XCTAssertNil(store.get())
    }
    
    func testArray() {
        let store = DefaultStore<[Int]>(forKey: key)
        
        let values = [Int.min, -1, 0, 1, 2, Int.max]
        store.set(values)
        
        guard let saved = store.get() else { XCTFail("saved value is nil.") ; return }
        XCTAssertEqual(saved, values)
        
        store.reset()
        XCTAssertNil(store.get())
    }
    
    func testArrayDate() {
        let store = DefaultStore<[Date]>(forKey: key)
        
        let date = Date()
        let values = [date, date, date]
        store.set(values)
        
        guard let saved = store.get() else { XCTFail("saved value is nil.") ; return }
        XCTAssertEqual(saved, values)
        
        store.reset()
        XCTAssertNil(store.get())
    }
    
    func testArrayURL() {
        let store = DefaultStore<[URL]>(forKey: key)
        
        let url = URL(string: "https://www.apple.com/")!
        let values = [url, url, url]
        store.set(values)
        
        guard let saved = store.get() else { XCTFail("saved value is nil.") ; return }
        XCTAssertEqual(saved, values)
        
        store.reset()
        XCTAssertNil(store.get())
    }
    
    func testCustomStruct() {
        let store = DefaultStore<PersonStruct>(forKey: key)
        
        let child = PersonStruct(name: "Frodo Baggins", age: 33, children: [])
        let parent = PersonStruct(name: "Bilbo Baggins", age: 111, children: [child])
        store.set(parent)
        
        guard let saved = store.get() else { XCTFail("saved value is nil.") ; return }
        XCTAssertEqual(saved, parent)
        
        store.reset()
        XCTAssertNil(store.get())
    }
    
    func testCustomClass() {
        let store = DefaultStore<PersonClass>(forKey: key)
        
        let child = PersonClass(name: "Frodo Baggins", age: 33, children: [])
        let parent = PersonClass(name: "Bilbo Baggins", age: 111, children: [child])
        store.set(parent)
        
        guard let saved = store.get() else { XCTFail("saved value is nil.") ; return }
        XCTAssertEqual(saved, parent)
        
        store.reset()
        XCTAssertNil(store.get())
    }
    
    func testRegister() {
        let defaultValue = "default value"
        let store = DefaultStore<String>(forKey: key, defaultValue: defaultValue)
        
        let registered = store.get()
        XCTAssertEqual(registered, defaultValue)
        
        let value = "string"
        store.set(value)
        
        let saved = store.get()
        XCTAssertEqual(saved, value)
        
        store.reset()
        let removed = store.get()
        XCTAssertEqual(removed, defaultValue)
    }
    
    func testRegisterDate() {
        let defaultValue = Date()
        let store = DefaultStore<Date>(forKey: key, defaultValue: defaultValue)
        
        let registered = store.get()
        XCTAssertEqual(registered, defaultValue)
        
        let value = Date(timeIntervalSinceNow: TimeInterval(1))
        store.set(value)
        
        let saved = store.get()
        XCTAssertEqual(saved, value)
        
        store.reset()
        let removed = store.get()
        XCTAssertEqual(removed, defaultValue)
    }
    
    func testRegisterURL() {
        let defaultValue = URL(string: "https://github.com/")!
        let store = DefaultStore<URL>(forKey: key, defaultValue: defaultValue)
        
        let registered = store.get()
        XCTAssertEqual(registered, defaultValue)
        
        let value = URL(string: "https://www.apple.com/")!
        store.set(value)
        
        let saved = store.get()
        XCTAssertEqual(saved, value)
        
        store.reset()
        let removed = store.get()
        XCTAssertEqual(removed, defaultValue)
    }
    
    func testRegisterArray() {
        let defaultValues = [0, 1, 2]
        let store = DefaultStore<[Int]>(forKey: key, defaultValue: defaultValues)
        
        guard let registered = store.get() else { XCTFail("registered value is nil.") ; return }
        XCTAssertEqual(registered, defaultValues)
        
        let values = [Int.min, -1, 0, 1, 2, Int.max]
        store.set(values)
        
        guard let saved = store.get() else { XCTFail("saved value is nil.") ; return }
        XCTAssertEqual(saved, values)
        
        store.reset()
        guard let removed = store.get() else { XCTFail("removed value is nil.") ; return }
        XCTAssertEqual(removed, defaultValues)
    }
}

/// test custom struct
struct PersonStruct: Codable {
    var name: String
    var age: Int
    var children: [PersonStruct]
}

extension PersonStruct: Equatable {
    static func == (lhs: PersonStruct, rhs: PersonStruct) -> Bool {
        return lhs.name == rhs.name &&
            lhs.age == rhs.age &&
            lhs.children == rhs.children
    }
}

/// test custom class
class PersonClass: Codable {
    var name: String
    var age: Int
    var children: [PersonClass]
    
    init(name: String, age: Int, children: [PersonClass]) {
        self.name = name
        self.age = age
        self.children = children
    }
}

extension PersonClass: Equatable {
    static func == (lhs: PersonClass, rhs: PersonClass) -> Bool {
        return lhs.name == rhs.name &&
            lhs.age == rhs.age &&
            lhs.children == rhs.children
    }
}

