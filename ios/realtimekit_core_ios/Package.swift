// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "realtimekit_core_ios",
    platforms: [
        .iOS("13.0"),
    ],
    products: [
        .library(
            name: "realtimekit-core-ios",
            targets: ["realtimekit_core_ios"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/dyte-in/mobile-core-bridge-spm.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "realtimekit_core_ios",
            dependencies: [
                .product(name: "RealtimeKitFlutterCoreKMM", package: "mobile-core-bridge-spm"),
            ],
            path: "./Sources/realtimekit_core_ios",
            resources: [
                .process("PrivacyInfo.xcprivacy"),
            ]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
