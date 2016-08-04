# StringExtension

A nice lib that collects all the extension I managed to use in my past project.

[![CI Status](http://img.shields.io/travis/matteocrippa/StringExtension.svg?style=flat)](https://travis-ci.org/matteocrippa/StringExtension)
[![Version](https://img.shields.io/cocoapods/v/StringExtension.svg?style=flat)](http://cocoapods.org/pods/StringExtension)
[![License](https://img.shields.io/cocoapods/l/StringExtension.svg?style=flat)](http://cocoapods.org/pods/StringExtension)
[![Platform](https://img.shields.io/cocoapods/p/StringExtension.svg?style=flat)](http://cocoapods.org/pods/StringExtension)

## Usage

`StringExtension` provide those awesome stuffs:

Let's assume to have a snippet like:

```swift
let name = "Matteo Crippa"
```

Now you can manage to:

- Numeric validation
```swift
name.isNumeric // it will return false (off course this time)
```

- Email validation
```swift
name.isEmail // it will return false (off course this time)
```

- Omissis string
```swift
name.omiss // will return the string
```
This func will return `--` if origin string is empty

- Monogram
```swift
name.monogram // MC
```
Generate the monogram of a string, it's very useful when you have to create a badge for users


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

StringExtension is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "StringExtension"
```

## Author

Matteo, matteo@boostco.de

## License

StringExtension is available under the MIT license. See the LICENSE file for more info.
