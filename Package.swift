// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "ENMobileSDK",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "ENMobileSetupSDK",  targets: ["ENMobileSetupSDKAuxiliaryTarget"]),
        .library(name: "ENMobileCoreSDK",  targets: ["ENMobileCoreAuxiliaryTarget"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.8.0"),
        .package(url: "https://github.com/hmlongco/Factory", from: "2.2.0"),
        .package(url: "https://github.com/Kitura/Swift-JWT", from: "3.6.200"),
        .package(url: "https://github.com/weichsel/ZIPFoundation.git", from: "0.9.17"),
        .package(url: "https://github.com/jrendel/SwiftKeychainWrapper", from: "4.0.1")
    ],
    targets: [
        .target(
            name: "ENMobileCoreAuxiliaryTarget",
            dependencies: [
                .target(name: "ENMobileCoreSDK"),
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "SwiftJWT", package: "Swift-JWT"),
                .product(name: "Factory", package: "Factory"),
                .product(name: "ZIPFoundation", package: "ZIPFoundation"),
                .product(name: "SwiftKeychainWrapper", package: "SwiftKeychainWrapper")
            ],
            path: "ENMobileCore"
        ),
        .target(
            name: "ENMobileSetupSDKAuxiliaryTarget",
            dependencies: [
                .target(name: "ENMobileSetupSDK"),
                .target(name: "ENMobileCoreAuxiliaryTarget"),
            ],
            path: "ENMobileSetup"
        ),
        .binaryTarget(
            name: "ENMobileCoreSDK",
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENMobileCoreSDK/0.0.1/ENMobileCoreSDK.zip",
            checksum: "a5ff9d02142c2cdcbeb2cb28a3e017274fb57103b1f9b1dd515d8fca89fea5e0"
        ),
        .binaryTarget(
            name: "ENMobileSetupSDK",
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENMobileSetupSDK/0.0.1/ENMobileSetupSDK.zip",
            checksum: "ece891f75e628974cd3a354674edd3a82a65f8961452253dd39305d1ed2f1262"
        )
    ]
)
