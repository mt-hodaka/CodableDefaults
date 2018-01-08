# CodableDefaults

[![Build Status](https://travis-ci.org/mt-hodaka/CodableDefaults.svg?branch=master)](https://travis-ci.org/mt-hodaka/CodableDefaults)
[![codecov](https://codecov.io/gh/mt-hodaka/CodableDefaults/branch/master/graph/badge.svg)](https://codecov.io/gh/mt-hodaka/CodableDefaults)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/mt-hodaka/CodableDefaults)
[![LICENSE](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/mt-hodaka/CodableDefaults/master/LICENSE)

Micro library for UserDefaults with Codable. 

## Usage

```swift
let username = DefaultStore<String>(forKey: key)

username.set("your name")

print(username.get()) // "your name"
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
