# CodableDefaults

[![Language](https://img.shields.io/badge/Swift-4.0-orange.svg)](https://swift.org/)
[![Platform](https://img.shields.io/cocoapods/p/CodableDefaults.svg?style=flat)](http://cocoadocs.org/docsets/CodableDefaults)
[![Build Status](https://travis-ci.org/mt-hodaka/CodableDefaults.svg?branch=master)](https://travis-ci.org/mt-hodaka/CodableDefaults)
[![codecov](https://codecov.io/gh/mt-hodaka/CodableDefaults/branch/master/graph/badge.svg)](https://codecov.io/gh/mt-hodaka/CodableDefaults)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/mt-hodaka/CodableDefaults)
[![Version](https://img.shields.io/cocoapods/v/CodableDefaults.svg?style=flat)](http://cocoadocs.org/docsets/CodableDefaults)
[![LICENSE](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/mt-hodaka/CodableDefaults/master/LICENSE)

Micro library for UserDefaults with [Codable](https://developer.apple.com/documentation/swift/codable). 

## Requirements

CodableDefaults is written Swift 4.

## Usage

CodableDefaults provides easy to use, and type safety. It supports [Codable](https://developer.apple.com/documentation/swift/codable) types in Swift standard library and Foundation.

```swift
let userID = DefaultStore<String>(forKey: "user ID")

userID.set("your ID") // sets to the UserDefaults.standard
userID.set(10) // ❗️compile error

userID.get() // -> "your ID"
```

### Custom Type

Just conform to the [Codable](https://developer.apple.com/documentation/swift/codable):

```swift
struct User: Codable {
    var name: String
    var following: [User]
}
```

then:

```swift
let friend = User(name: "Friend", following: [])
let you = User(name: "You", following: [friend])

let user = DefaultStore<User>(forKey: "user")

user.set(you)

user.get() // -> User(name: "You", following: [friend])
```

### Initial value

Use initializer wrapping [`register(defaults:)`](https://developer.apple.com/documentation/foundation/userdefaults/1417065-register).

```swift
let shouldShowThumbnail = DefaultStore<Bool>(forKey: “shouldShowThumbnail”, defaultValue: true)

shouldShowThumbnail.get() // -> true
```

### With specified suite name

Init with `UserDefaults` instance.

```swift
let defaults = UserDefaults(suiteName: “domain name”)

let numbers = DefaultStore<[Int]>(forKey: “numbers”, userDefaults: defaults)
```

## Installation

### [Carthage](https://github.com/Carthage/Carthage)

Insert to your Cartfile:

```
github "mt-hodaka/CodableDefaults"
```

### [CocoaPods](https://github.com/cocoapods/cocoapods)

Insert to your Podfile:

```
pod 'CodableDefaults'
```
