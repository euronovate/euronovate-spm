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
    dependencies: [],
    targets: [
        .target(
            name: "ENMobileCoreAuxiliaryTarget",
            dependencies: [
                .target(name: "ENMobileCoreSDK")
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
            checksum: "4b6a9d5efead86907ef094b87b2c17ca674143de59c67ad1cb15ad5ba12108f6"
        ),
        .binaryTarget(
            name: "ENMobileSetupSDK",
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENMobileSetupSDK/0.9.0/ENMobileSetupSDK.zip",
            checksum: "fcb87e7d04f1b1adc3aa2599cc9c90be313cf6ba4e48f67bebdecd0fa7342d58"
        ),
        .binaryTarget(
            name: "ENMobileSignatureSDK",
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENMobileSignatureSDK/0.9.0/ENMobileSignatureSDK.zip",
            checksum: "9ecdedf5dd6d921457f74901c154013ad3824c12849d9adfbb777f33cce5f310"
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
