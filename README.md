# Fusion

A Swift Package (library) that renders JSON data into SwiftUI views.

## Supported Views

* View
* Text
* Image
* Stack
* Scroll

The `View` properties can be applied to all models.

## Basic Usage

```swift
struct MyView: View {

    var body: some View {
        JSONView(url: ...)
    }
}
```

## Make A Custom Model

Make your own (view) model:

```swift
struct MyModel: FusionModel, View {
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
