// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Fusion",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Fusion",
            targets: ["Fusion"]
        )
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Fusion",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "FusionTests",
            dependencies: ["Fusion"]
        )
    ]
)
