// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Heroes",
    platforms: [.macOS(.v10_15), .iOS(.v17), .watchOS(.v10), .visionOS(.v1)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Heroes",
            targets: ["Heroes"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Heroes"),
        .testTarget(
            name: "HeroesTests",
            dependencies: ["Heroes"]),
    ]
)
