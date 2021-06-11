// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ChartsUI",
    platforms: [.iOS(.v13), .macOS(.v10_15)],
    products: [
        .library(
            name: "ChartsUI",
            targets: ["ChartsUI"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "ChartsUI",
			dependencies: []),
        .testTarget(
            name: "ChartsUITests",
			dependencies: ["ChartsUI"])
    ]
)
