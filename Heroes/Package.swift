// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "Heroes",
    defaultLocalization: "en",
    platforms: [.macOS(.v12), .iOS(.v17), .watchOS(.v10), .visionOS(.v1)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "HeroShared",
            targets: ["HeroShared"]),
        .library(
            name: "HeroiOS",
            targets: ["HeroiOS"]),
        .library(
            name: "Macros",
            targets: ["Macros"]
        ),
        .executable(
            name: "MacroClient",
            targets: ["MacroClient"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-syntax.git", from: "509.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "HeroShared"),
        .testTarget(
            name: "HeroSharedTests",
            dependencies: ["HeroShared"]),
        .target(
            name: "HeroiOS",
            dependencies: ["HeroShared"]),
        .testTarget(
            name: "HeroiOSTests",
            dependencies: ["HeroiOS", "HeroShared"]),
        .macro(
            name: "MacroMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),
        .target(name: "Macros", dependencies: ["MacroMacros"]),
        .executableTarget(name: "MacroClient", dependencies: ["Macros"]),
        .testTarget(
            name: "MacroTests",
            dependencies: [
                "MacroMacros",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ]
        ),
    ]
)
