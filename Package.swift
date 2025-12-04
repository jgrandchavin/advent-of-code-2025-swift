// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdventOfCode2025",
    products: [
        .executable(
            name: "AdventOfCode2025",
            targets: ["AdventOfCode2025"]
        )
    ],
    targets: [
        .executableTarget(
            name: "AdventOfCode2025",
            resources: [
                .process("Resources")
            ]
        )
    ]
)
