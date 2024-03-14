// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "ENMobileCoreSDK",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "ENMobileCoreSDK",
            targets: ["AuxiliaryTarget"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.8.0"),
        .package(url: "https://github.com/hmlongco/Factory", from: "2.2.0"),
        .package(url: "https://github.com/Kitura/Swift-JWT", from: "3.6.200"),
        .package(url: "https://github.com/weichsel/ZIPFoundation.git", from: "0.9.17")
    ],
    targets: [
        .target(
            name: "AuxiliaryTarget",
            dependencies: [
                .target(name: "ENMobileCoreSDK"),
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "SwiftJWT", package: "Swift-JWT"),
                .product(name: "Factory", package: "Factory"),
                .product(name: "ZIPFoundation", package: "ZIPFoundation")
            ],
            path: "AuxiliaryEmpty"
        ),
        .binaryTarget(
            name: "ENMobileCoreSDK",
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENMobileCoreSDK/0.0.1/ENMobileCoreSDK.zip",
            checksum: "6ff2bc257ed3f13d434d7814d570b9562d192dc139d77e605d13a327fd959a85"
        ),
    ]
)
