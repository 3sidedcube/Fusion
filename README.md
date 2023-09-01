# Fusion

A Swift Package (library) that renders JSON data into SwiftUI views.

## Basic usage

```swift
struct MyView: View {

    var body: some View {
        JSONView(url: ...)
    }
}
```

## How it works

For every UI component that could be represented as a JSON object, a `FusionModel` is created like:

```swift
struct FusionText: FusionModel {
    var value: String
    var isMarkdown: Bool?
    ...
}
```

Since a `FusionModel` is `Decodable`, this can be decoded from a JSON such as:

```json
{
    "type": "Text",
    "value": "Hello 👋",
    "isMarkdown": false,
    ...
}
```

Fusion decodes the JSON into its corresponding model using the `type` property.
It's matched to a model type in the `Fusion.shared.models` property.

Since a `FusionModel` is also a `View`, it can then be rendered into UI.
A similar logic applies to `FusionAction`s, except they are rendered as `ViewModifiers`.

The models in this library are prefixed with the `"Fusion*"` suffix to not interfere with the SwiftUI types.

## Supported types

* View
* Text
* Image
* Stack
* Scroll
* Screen

The `View` properties can be applied to all models.

## Make a custom model

Make your own (view) model:

```swift
struct MyModel: FusionModel {
    var myProperty: String
    ...
    
    var body: some View {
        ...
    }
}
```

and register it on the `Fusion`:

```swift
Fusion.shared.models["MyModel"] = MyModel.self
```

## What motivated the name "Fusion"?

Fusion here means to bring together two platforms, iOS and Android, powered by a single data source.  
For web-server apps, the business logic should sit server-side as much as possible.
Fusion aims to be as simple as "server tell me what to draw and I'll draw it".

## Legacy

This framework was initially developed (and nearly finished) in UIKit. The work can be found in the branch: `legacy/ui-kit`.