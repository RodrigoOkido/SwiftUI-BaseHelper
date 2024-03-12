// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DesignSystem",
    defaultLocalization: "en",
    platforms: [
            .iOS(.v17)
        ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DesignSystem",
            targets: ["DesignSystem"]),
    ],
    // If dependencies is needed
//    dependencies: [
//        .package(url: "https://github.com/airbnb/lottie-spm.git", .upToNextMinor(from: "4.2.0")),
//        .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMinor(from: "7.9.1")),
//        .package(name: "MyCustomPackage", path: "../../MyCustomPackagePath")
//    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DesignSystem",
            // If dependencies or resources needed. Its added inside .target
//            dependencies: [
//                .product(name: "Lottie", package: "lottie-spm"),
//                .product(name: "Kingfisher", package: "Kingfisher"),
//                .product(name: "MyCustomPackage", package: "MyCustomPackage")
//            ],
            resources: [.process("Resources")]),
        .testTarget(
            name: "DesignSystemTests",
            dependencies: ["DesignSystem"]),
    ]
)
