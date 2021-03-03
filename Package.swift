// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Fusion",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "Fusion",
            targets: ["Fusion"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "4.0.0"),
        .package(url: "https://github.com/BenShutt/HTTPRequest.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "Fusion",
            dependencies: ["SwiftyJSON", "HTTPRequest"],
            path: "Sources"
        ),
        .testTarget(
            name: "FusionTests",
            dependencies: ["Fusion"]
        )
    ]
)
