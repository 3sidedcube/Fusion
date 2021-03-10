# Fusion
JSON data driven `UITableView` UI for iOS fetched from a remote API (e.g. headless CMS).

## Installation
### Carthage
[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. To integrate into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "3sidedcube/Fusion" "develop"
```
It's recommended you build with `xcframework`s.


## Make your own model
It's extremely likely an app using this framework will want to add its own model driven dynamic UI.
Doing so is, more or less, as simple as creating a `JSONModel` and hooking it up to a `Row` so the framework knows how to draw it.

1. Create your `JSONModel`
```swift
/// A model which drives the UI for a CardRow
struct Card: Codable, JSONModel {

    // Title of the card 
    var title: String?
    
    // etc...
}
///
```
2. Create a `Row` to draw your model. The model doesn't have to be passed into the initializer, you can hook up the properties however you want (e.g. when creating a `Row` from the model).
```swift
/// A `Row` to draw the `Card` model
class CardRow: Row {

     /// `Card` model to drive UI
     let card: Card
     
     /// Default memberwise initializer
     ///
     /// - Parameters:
     ///   - card: `Card`
     init(card: Card) {
         self.card = card
     }
     
     // Implement `Row`...
}
```
3. Conform your model to `Row`, `RowConvertible`, or `RowArrayConvertible` so the framework knows how your model should be drawn
```swift
extension Card: RowConvertible {

    /// Map `Card` model to `CardRow` 
    public func toRow() throws -> Row {
        return CardRow(card: self)
    }
}
```
4. Declare your model as one of the app's `JSONModel`s
```
/// Override `Fusion` to provide app specific configuration
class AppFusion: Fusion {

    /// Append additional app specific `JSONModel`s
    override var jsonModelTypes: [JSONModel.Type] {
        return super.jsonModelTypes + [
            Card.self
        ]
    }
}
```
5. Ensure the singleton `Fusion` instance uses your `Fusion` subclass. E.g. in `application(_:didFinishLaunchingWithOptions:)`
```swift
Fusion.shared = AppFusion()
```

## JSONModel
A `JSONModel` is an entity which can be dynamically instantiated from a `JSON` ([SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)) .
The `JSON` should include a `"class"` field which defines the `JSONModel` to instantiate.
If a `JSONModel` has the same `classIdentifier` as the `"class"` field, the `JSONModel` will try to decode itself.

### Dynamic UI
Typically, a `JSONModel` specifies how the properties of a `UIView` should be configured.
This framework can use these models to draw a `UIView`s in a `UITableView`.

### Inheritance
It would make sense for a lot of the `JSONModel`s to share properties. E.g. properties on a `UIView` such as `backgroundColor`, or `cornerRadius`. `Decodable` doesn't work with inheritance out of the box, so currently all `JSONModel`s are `struct`s which specify all of the properties required to draw the `UIView`.

## Development
To install dependencies, simply run the `install.sh` script.
The script will, using [Carthage](https://github.com/Carthage/Carthage), fetch and build the
`.xcframework`s linked in the `.xcodeproj`.
```bash
./install.sh
``` 

## Swift Package Manager
This framework is fundamentally driven by `UIKit` for (only) iOS apps.
The Swift Package Manager integration has been started. Indeed, the framework
is structured like a Swift Package. When iOS only Swift Packages become more
standard we will update dependencies and add full support here.

## FAQ

### Why call the model `Text` instead of `TextView`?
The `Text` represents the model/data read from the API. A "View" is an instance of a `UIView`.
Indeed, the `Text` model ultimately drives the `UIView` (e.g. `UILabel`) defining how it's properties should look, but it is not a `UIView` itself.

### Why make `ImageContainerView` and `LabelContainerView`, just use `UIImageView` and `UILabel` respectively?
These are created to handle the `padding` and `margin` properties found on most models which drive the views (`UIView` properties). These are, when phrased like this, more of an Android thing. The iOS equivalent for `margins` is `UIEdgeInsets` which set the `constant` property on `NSLayoutConstraint`s, `padding` can vary but is much the same. The `LabelContainerView`, essentially, wraps an iOS `UILabel` in a container `UIView` where the `padding` and `margin` can be set, like a `TextView` does out of the box in Android.
