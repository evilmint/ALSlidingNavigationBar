# ALSlidingNavigationBar

[![CI Status](http://img.shields.io/travis/evilmint/ALSlidingNavigationBar.svg?style=flat)](https://travis-ci.org/evilmint/ALSlidingNavigationBar)
[![Version](https://img.shields.io/cocoapods/v/ALSlidingNavigationBar.svg?style=flat)](http://cocoapods.org/pods/ALSlidingNavigationBar)
[![License](https://img.shields.io/cocoapods/l/ALSlidingNavigationBar.svg?style=flat)](http://cocoapods.org/pods/ALSlidingNavigationBar)
[![Platform](https://img.shields.io/cocoapods/p/ALSlidingNavigationBar.svg?style=flat)](http://cocoapods.org/pods/ALSlidingNavigationBar)

![Running pod example](ALSlidingNavigationBar.gif "Running pod example")

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
* Swift >= 3.0

## Installation

ALSlidingNavigationBar is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ALSlidingNavigationBar"
```

## Usage

### Create ALSlidingNavigationBar
Create an object of type `ALSlidingNavigationBar` using the default constructor and passing references of your navigation bar, navigation item and the view you would like to slide.

```swift
self.slidingNavigationBar = ALSlidingNavigationBar(
    navigationBar: self.navigationController!.navigationBar,
    navigationItem: self.navigationItem,
    navigationBarView: self.navigationBarView
)
```

### Choose an anchor

There are two anchor types to choose from - view or offset.

#### View

```swift
self.slidingNavigationBar.setAnchor(view: self.anchorView)
```

#### Offset

```swift
self.slidingNavigationBar.setAnchor(offsetY: 150)
```

## Author

Aleksander Lorenc, thaxsillion@gmail.com

## License

ALSlidingNavigationBar is available under the MIT license. See the LICENSE file for more info.
