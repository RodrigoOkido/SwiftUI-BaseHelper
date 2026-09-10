// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreNetworkLayer",
    // Unlike DesignSystem, this package is pure Foundation with no UIKit/SwiftUI code,
    // so it can also build for macOS. That is what lets `swift test` run the suite on the
    // host without booting a simulator.
    platforms: [
        .iOS(.v26),
        .macOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CoreNetworkLayer",
            targets: ["CoreNetworkLayer"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        .target(
            name: "CoreNetworkLayer",
            // Matches the app target's SWIFT_APPROACHABLE_CONCURRENCY = YES. Without it,
            // `nonisolated` async functions in this package would hop to the global executor
            // instead of inheriting the caller's actor — which would move JSON decoding off
            // the main actor and change behaviour that the app target deliberately opted into.
            swiftSettings: [
                .enableUpcomingFeature("NonisolatedNonsendingByDefault")
            ]),
        .testTarget(
            name: "CoreNetworkLayerTests",
            dependencies: ["CoreNetworkLayer"]),
    ],
    swiftLanguageModes: [.v6]
)
