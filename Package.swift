// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Fusion",
    platforms: [
        .iOS(.v15),
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
            branch: "fix/font-weight"
        )
    ],
    targets: [
        .target(
            name: "Fusion",
            dependencies: [
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
