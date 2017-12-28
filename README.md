![MarkerKit](https://github.com/pchelnikov/MarkerKit/blob/master/Assets/marker-kit.jpg)

# MarkerKit
Lightweight and easy to use wrapper for Auto Layout Constraints (iOS 8+ support), inspired by: [https://github.com/ustwo/autolayout-helper-swift](https://github.com/ustwo/autolayout-helper-swift)

## Requirements

- iOS 8.0+
- Xcode 9.0+
- Swift 4.0+

## Installation

### Manually

- Add the `MarkerKit.swift` file to your Xcode project.

## Usage

### Quick Start

```swift
import MarkerKit

class MyViewController: UIViewController {

    lazy var myView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(myView)
        
        myView.mrk.height(50)
        myView.mrk.width(50)
        myView.mrk.center(to: view)
    }
}
```

### More examples:

**Edges placing**

**Centering**

**Modify constraints**

## License

Device is available under the MIT license. See the LICENSE file for more info.
