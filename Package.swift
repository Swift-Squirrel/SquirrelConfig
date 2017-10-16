// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "SquirrelConfig",
    products: [
        .library(
            name: "SquirrelConfig",
            targets: ["SquirrelConfig"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kylef/PathKit.git",  from: "0.8.0"),
        .package(url: "https://github.com/jpsim/Yams.git",  from: "0.3.6"),
        .package(url: "https://github.com/Swift-Squirrel/Squirrel-Core.git", from: "0.1.2")
    ],
    targets: [
        .target(
            name: "SquirrelConfig",
            dependencies: ["Yams", "PathKit", "SquirrelCore"]),
        .testTarget(
            name: "SquirrelConfigTests",
            dependencies: ["SquirrelConfig"]),
    ]
)
