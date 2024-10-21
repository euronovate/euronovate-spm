// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "ENMobileSDK",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "ENMobileSetupSDK",  targets: ["ENMobileSetupSDKAuxiliaryTarget"]),
        .library(name: "ENMobileSignatureSDK",  targets: ["ENMobileSignatureSDKAuxiliaryTarget"])
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
        .target(
            name: "ENMobileSignatureSDKAuxiliaryTarget",
            dependencies: [
                .target(name: "ENMobileSignatureSDK"),
                .target(name: "ENLibPdf"),
                .target(name: "ENMobileCoreAuxiliaryTarget"),
            ],
            path: "ENMobileSignature"
        ),
        .binaryTarget(
            name: "ENMobileCoreSDK",
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENMobileCoreSDK/0.0.1/ENMobileCoreSDK.zip",
            checksum: "161399af74abc6adab265e8fc716091ff690a8b29cbf2df2611798c6ecd092b6"
        ),
        .binaryTarget(
            name: "ENMobileSetupSDK",
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENMobileSetupSDK/0.0.1/ENMobileSetupSDK.zip",
            checksum: "e1b1841d37fe6fabf0269f57b3b7b9b883dfd2df211d0672ce107d09cfa84912"
        ),
        .binaryTarget(
            name: "ENMobileSignatureSDK",
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENMobileSignatureSDK/0.0.1/ENMobileSignatureSDK.zip",
            checksum: "d6221ada128c8510c7446c32e1f695d7a6c8747aa3b1ccda52c90c601c2a9de6"
        ),
        .binaryTarget(
            name: "ENLibPdf",
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENLibPdf/2.4.3/ENLibPdf.zip",
            checksum: "9d76f45e543f597a54fb57eaea3a8994c4d85cab44d91db2e01ebd95c47a14d9"
        )
    ]
)
