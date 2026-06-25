// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "ENMobileSDK",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "ENMobileSetupSDK",
            targets: ["ENMobileSetupSDKAuxiliaryTarget"]
        ),
        .library(
            name: "ENMobileSignatureSDK",
            targets: ["ENMobileSignatureSDKAuxiliaryTarget"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", exact: "5.9.1")
    ],
    targets: [
        .target(
            name: "ENMobileCoreAuxiliaryTarget",
            dependencies: [
                .target(name: "ENMobileCoreSDK"),
                .product(name: "AlamofireDynamic", package: "Alamofire")
            ],
            path: "ENMobileCore"
        ),
        .target(
            name: "ENMobileSetupSDKAuxiliaryTarget",
            dependencies: [
                .target(name: "ENMobileSetupSDK"),
                .target(name: "ENMobileCoreAuxiliaryTarget")
            ],
            path: "ENMobileSetup"
        ),
        .target(
            name: "ENMobileSignatureSDKAuxiliaryTarget",
            dependencies: [
                .target(name: "ENMobileSignatureSDK"),
                .target(name: "ENMobileSetupSDKAuxiliaryTarget"),
                .target(name: "ENMobileCoreAuxiliaryTarget"),
                .target(name: "ENLibPdf"),
                .target(name: "ENCrossToolbox")
            ],
            path: "ENMobileSignature"
        ),
        .binaryTarget(
            name: "ENMobileCoreSDK",
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENMobileCoreSDK/0.9.0/ENMobileCoreSDK.zip",
            checksum: "8984cbd31b7dce24d89f4a9c08e041a9fcf87b972c64347c5a2c786c59b51957"
        ),
        .binaryTarget(
            name: "ENMobileSetupSDK",
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENMobileSetupSDK/0.9.0/ENMobileSetupSDK.zip",
            checksum: "a0ae49da2a313721bfff6f892659b808da0818c534426aa55b9297b9d2fe9f47"
        ),
        .binaryTarget(
            name: "ENMobileSignatureSDK",
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENMobileSignatureSDK/0.9.0/ENMobileSignatureSDK.zip",
            checksum: "16a19d6b4eba6b95de9f9bb8c349d67e9b7f58c7dc425e189740acd1e83f9264"
        ),
        .binaryTarget(
            name: "ENLibPdf",
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENLibPdf/2.4.8/ENLibPdf.zip",
            checksum: "cc9c5bc11466f44840aad7397893b262511b2f647e6483bb2fcf3f0430c45c4c"
        ),
        .binaryTarget(
            name: "ENCrossToolbox",
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENCrossToolbox/1.3.0/ENCrossToolbox.zip",
            checksum: "77faf3cd403bd6077d2bf977ebd40a9018ab99b63dd07a2f86996a85b174baf5"
        )
    ]
)
