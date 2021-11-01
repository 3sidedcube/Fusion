// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Fusion",
    platforms: [
        .iOS(.v14),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "Fusion",
            targets: ["Fusion"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/Alamofire/Alamofire.git",
            .upToNextMajor(from: "5.0.0")
        ),
        .package(
            url: "https://github.com/SwiftyJSON/SwiftyJSON.git",
            .upToNextMajor(from: "5.0.0")
        ),
        .package(
            url: "https://github.com/onevcat/Kingfisher.git",
            .upToNextMajor(from: "7.0.0")
        )
    ],
    targets: [
        .target(
            name: "Fusion",
            dependencies: ["Alamofire", "SwiftyJSON", "Kingfisher"],
            path: "Sources"
        ),
        .testTarget(
            name: "FusionTests",
            dependencies: ["Fusion"]
        )
    ]
)
