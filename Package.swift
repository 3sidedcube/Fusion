// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Fusion",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "Fusion",
            targets: ["Fusion"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/3sidedcube/cubefoundation-ios.git",
            branch: "develop"
        ),
        .package(
            url: "https://github.com/SwiftyJSON/SwiftyJSON.git",
            .upToNextMajor(from: "5.0.0")
        )
    ],
    targets: [
        .target(
            name: "Fusion",
            dependencies: [
                "SwiftyJSON",
                .product(
                    name: "CubeFoundation",
                    package: "cubefoundation-ios"
                ),
                .product(
                    name: "CubeFoundationSwiftUI",
                    package: "cubefoundation-ios"
                )
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "FusionTests",
            dependencies: ["Fusion"],
            path: "Tests"
        ),
    ]
)
