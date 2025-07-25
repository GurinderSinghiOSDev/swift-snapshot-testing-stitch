// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SnapshotTestingStitch",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "SnapshotTestingStitch",
            targets: ["SnapshotTestingStitch"]
        ),
    ],
    dependencies: [
        .package(name: "swift-snapshot-testing",
                 url: "https://github.com/pointfreeco/swift-snapshot-testing.git",
                 from: "1.17.5"),
        .package(name: "SnapshotTestingHEIC",
                 url: "https://github.com/alexey1312/SnapshotTestingHEIC.git",
                 from: "1.5.0"),
    ],
    targets: [
        .target(
            name: "SnapshotTestingStitch",
            dependencies: [
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
                .product(name: "SnapshotTestingHEIC", package: "SnapshotTestingHEIC"),
            ]
        ),
        
        .testTarget(
            name: "SnapshotTestingStitchTests",
            dependencies: ["SnapshotTestingStitch"],
            exclude: ["__Snapshots__"]
        ),
    ]
)
