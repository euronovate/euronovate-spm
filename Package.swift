// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "ENMobileSDK",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "ENMobileSetupSDK",  targets: ["ENMobileSetupSDKAuxiliaryTarget"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.8.0"),
        .package(url: "https://github.com/hmlongco/Factory", from: "2.2.0"),
        .package(url: "https://github.com/Kitura/Swift-JWT", from: "3.6.200"),
        .package(url: "https://github.com/weichsel/ZIPFoundation.git", from: "0.9.17")
    ],
    targets: [
        .target(
            name: "ENMobileCoreAuxiliaryTarget",
            dependencies: [
                .target(name: "ENMobileCoreSDK"),
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "SwiftJWT", package: "Swift-JWT"),
                .product(name: "Factory", package: "Factory"),
                .product(name: "ZIPFoundation", package: "ZIPFoundation")
            ],
            path: "AuxiliaryEmpty"
        ),
        .target(
            name: "ENMobileSetupSDKAuxiliaryTarget",
            dependencies: [
                .target(name: "ENMobileSetupSDK"),
                .target(name: "ENMobileCoreAuxiliaryTarget"),
            ],
            path: "AuxiliaryEmpty"
        ),
        .binaryTarget(
            name: "ENMobileCoreSDK",
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENMobileCoreSDK/0.0.1/ENMobileCoreSDK.zip",
            checksum: "7c6dc618175101866d4d09ebd0303dca85c1c55707b243a4af2f4d252f8bba62"
        ),
        .binaryTarget(
            name: "ENMobileSetupSDK",
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENMobileSetupSDK/0.0.1/ENMobileSetupSDK.zip",
            checksum: "ca2101d719b933547e7b9926a6fa045b2f3a1a450d6dea44a1fbcf9ed42712a6"
        )
    ]
)
