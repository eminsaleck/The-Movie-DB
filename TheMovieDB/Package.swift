// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TheMovieDB",
    defaultLocalization: "en",
    platforms: [
      .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "Domain", targets: ["Domain"]),
        .library(name: "Data", targets: ["Data"]),
        .library(name: "Networking", targets: ["Networking"]),
        .library(name: "Persistance", targets: ["Persistance"]),
        .library(name: "KeychainStorage", targets: ["KeychainStorage"]),
        .library(name: "DependencyInjection", targets: ["DependencyInjection"]),
        .library(name: "Shared", targets: ["Shared"]),
        .library(name: "Handlers", targets: ["Handlers"]),
        .library(name: "AccountFeature", targets: ["AccountFeature"]),
        .library(name: "TabBarFeature", targets: ["TabBarFeature"]),
        .library(name: "SplashFeature", targets: ["SplashFeature"]),
        .library(name: "MoviesFeature", targets: ["MoviesFeature"]),
        .library(name: "UI", targets: ["UI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/evgenyneu/keychain-swift.git", from: "14.0.0"),
        .package(url: "https://github.com/yacir/CollectionViewSlantedLayout.git", from: "3.0.1"),
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.8.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "MoviesFeature",
            dependencies: [
                "Shared",
                "UI",
                "DependencyInjection",
                "Domain",
                "Handlers",
            ]),
        .target(
            name: "SplashFeature",
            dependencies: [
                "Handlers",
                "Domain",
                "Shared",
                "UI",
                "DependencyInjection",
            ]),
        .target(
            name: "TabBarFeature",
            dependencies: [
                "Shared",
                "Domain",
                "MoviesFeature",
            ]),
        .target(
            name: "DependencyInjection",
            dependencies: [
                "Persistance",
                "Domain",
                "Data",
                "Networking",
                "Swinject",
                "Handlers",
            ]),
        .target(
            name: "Domain",
            dependencies: [
            ]),
        .target(
            name: "Data",
            dependencies: [
                "Domain",
            ]),
        .target(
            name: "Networking",
            dependencies: [
                "Domain",
                "Data",
            ]),
        .target(
            name: "KeychainStorage",
            dependencies: [
                "Domain",
                "Networking",
                .product(name: "KeychainSwift", package: "keychain-swift")
            ]),
        .target(
            name: "Persistance",
            dependencies: [
                "Domain",
                "Data",
            ]),
        .target(
          name: "UI",
          dependencies: [
          ]),
        .target(
          name: "Shared",
          dependencies: [
            "Domain",
            
          ]),
        .target(
          name: "Handlers",
          dependencies: [
            "Domain",
            "Shared",
            "TabBarFeature",
          ]),
        .target(
          name: "AccountFeature",
          dependencies: [
            "Domain",
            "UI",
            "Shared",
            "Handlers",
            .product(name: "CollectionViewSlantedLayout", package: "CollectionViewSlantedLayout")
          ]),
    ]
)
