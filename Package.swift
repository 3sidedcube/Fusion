// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Fusion",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "Fusion",
            targets: ["Fusion"]
        )
    ],
    targets: [
        .target(
            name: "Fusion",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "FusionTests",
            dependencies: ["Fusion"],
            path: "Tests"
        ),
    ]
)
