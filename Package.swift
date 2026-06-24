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
            checksum: "944c28131a1c0349080354c4f2adf3e40eae528b6e4b35251aedf3190376525e"
        ),
        .binaryTarget(
            name: "ENMobileSetupSDK",
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENMobileSetupSDK/0.9.0/ENMobileSetupSDK.zip",
            checksum: "f18bc8d6ffe2ab31a7ed881de421e6ae6bc13cab25137d02b6175e2f97bd9587"
        ),
        .binaryTarget(
            name: "ENMobileSignatureSDK",
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENMobileSignatureSDK/0.9.0/ENMobileSignatureSDK.zip",
            checksum: "1a87409d56f72c5eb7181112dbbde55fc6af588bc2ddce82e416f8c8978686ef"
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
