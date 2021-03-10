# Fusion
JSON data driven `UITableView` UI for iOS fetched from a remote API (e.g. headless CMS).

## Install
To install, simply run the `install.sh` script.
The script will, using [Carthage](https://github.com/Carthage/Carthage), fetch and build the
`.xcframework`s linked in the `.xcodeproj`.
```bash
./install.sh
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
