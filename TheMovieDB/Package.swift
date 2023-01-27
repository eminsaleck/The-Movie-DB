// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TheMovieDB",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "AppFeature", targets: ["AppFeature"]),
        .library(name: "Common", targets: ["Common"]),
        .library(name: "UI", targets: ["UI"]),
        .library(name: "Network", targets: ["Network"]),
        .library(name: "Networking", targets: ["Networking"]),
        .library(name: "Persistance", targets: ["Persistance"]),
        .library(name: "PersistanceRealm", targets: ["PersistanceRealm"]),
        .library(name: "AccountFeature", targets: ["AccountFeature"]),
        .library(name: "MovieDetailsFeatureInterface", targets: ["MovieDetailsFeatureInterface"]),
        .library(name: "MovieDetailsFeature", targets: ["MovieDetailsFeature"]),
        .library(name: "MovieListFeatureInterface", targets: ["MovieListFeatureInterface"]),
        .library(name: "MovieListFeature", targets: ["MovieListFeature"]),

    ],
    dependencies: [
        .package(url: "https://github.com/evgenyneu/keychain-swift.git", from: "14.0.0"),
        .package(url: "https://github.com/realm/realm-swift.git", from: "10.0.0"),
        .package(url: "https://github.com/pointfreeco/combine-schedulers.git", from: "0.9.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Network",
            dependencies: [
            ]
        ),
        .target(
            name: "Persistance",
            dependencies: [
                "Common",
            ]
        ),
        .target(
            name: "PersistanceRealm",
            dependencies: [
                "Persistance",
                .product(name: "RealmSwift", package: "realm-swift"),
            ]
        ),
        .target(
            name: "Common",
            dependencies: [
                .product(name: "KeychainSwift", package: "keychain-swift"),
            ]
        ),
        
            .target(
                name: "KeychainStorage",
                dependencies: [
                    "Common",
                ]
            ),
        
            .target(
                name: "Networking",
                dependencies: [
                    "Network",
                ]
            ),
        
            .target(
                name: "UI",
                dependencies: [
                    "Common",
                ],
                resources: [
                    .process("Resources"),
                ]
            ),
        
            .target(
                name: "AccountFeature",
                dependencies: [
                    "Common",
                    "Persistance",
                    "Network",
                    "MovieListFeatureInterface",
                    "UI",
                    .product(name: "CombineSchedulers", package: "combine-schedulers"),
                ]
            ),
        
            .target(
                name: "MovieDetailsFeatureInterface",
                dependencies: [
                    "Network",
                    "Common",
                    "Persistance",
                ]
            ),
        .target(
            name: "MovieDetailsFeature",
            dependencies: [
                "Common",
                "MovieDetailsFeatureInterface",
                "UI",
            ]
        ),
        
            .target(
                name: "MovieListFeatureInterface",
                dependencies: [
                    "Network",
                    "Persistance",
                    "Common",
                    "MovieDetailsFeatureInterface",
                ]
            ),
        .target(
            name: "MovieListFeature",
            dependencies: [
                "MovieListFeatureInterface",
                "Common",
                "UI",
                "MovieDetailsFeatureInterface",
            ]
        ),
        
            .target(
                name: "AppFeature",
                dependencies: [
                    "PersistanceRealm",
                    "Common",
                    "UI",
                    "MovieListFeatureInterface",
                    "MovieDetailsFeature",
                    "MovieListFeature",
                    "MovieListFeatureInterface",
                    "KeychainStorage",
                    "Network",
                    "Networking",
                    "Persistance",
                    "AccountFeature"
                ]),
        
    ]
)
