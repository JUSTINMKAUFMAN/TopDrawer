# TopDrawer

[![Version](https://img.shields.io/cocoapods/v/TopDrawer.svg?style=flat)](https://cocoapods.org/pods/TopDrawer)
[![License](https://img.shields.io/cocoapods/l/TopDrawer.svg?style=flat)](https://cocoapods.org/pods/TopDrawer)
[![Platform](https://img.shields.io/cocoapods/p/TopDrawer.svg?style=flat)](https://cocoapods.org/pods/TopDrawer)

A top drawer that can be pulled up/down over the screen, written in Swift.

<p align="center">
    <img src="/TopDrawer.gif" />
</p>

## Features

 - Drawer visibility can be toggled on/off
 - Stays on top of the visible hierarchy
 - Does not prevent interaction with content underneath the drawer (as is the case with modal drawers)

## Installation

### Cocoapods

TopDrawer is available through [CocoaPods](https://cocoapods.org). To install it, add the following to your `Podfile`:

```ruby
pod 'TopDrawer', '~> 0.1.3'
```

### Carthage

To install via [Carthage](https://github.com/Carthage/Carthage), add the following to your `Cartfile`:

```ogdl
github "JUSTINMKAUFMAN/TopDrawer" "0.1.3"
```

## Usage

The top drawer can be added to any `UIViewController` simply by initializing an instance of `TopDrawer` and adding it as a subview. For example:

```swift
class ViewController: UIViewController {
    let topDrawer = TopDrawer()

    init() {
        super.init(nibName: nil, bundle: nil)
        view.addSubview(topDrawer)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

Note that you should _not_ add your own auto-layout constraints to `TopDrawer` (layout is handled internally by adjusting the frame position/visibility).

See the sample project for a basic implementation. 

## Author

Justin Kaufman, jmkauf@gmail.com

## License

TopDrawer is available under the MIT license. See the LICENSE file for more info.
