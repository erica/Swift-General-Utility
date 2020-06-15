// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GeneralUtility",
    platforms: [
      .macOS(.v10_12)
    ],
    products: [
        .library(
            name: "GeneralUtility",
            targets: ["GeneralUtility"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "GeneralUtility",
            dependencies: [],
            path: "Sources/"
            ),
    ],
    swiftLanguageVersions: [
      .v5
    ]
)
