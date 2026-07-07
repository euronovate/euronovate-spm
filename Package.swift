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
            targets: [
                "ENMobileSetupSDK",
                "ENMobileCoreSDK"
            ]
        ),
        .library(
            name: "ENMobileSignatureSDK",
            targets: [
                "ENMobileSignatureSDK",
                "ENMobileSetupSDK",
                "ENMobileCoreSDK",
                "ENLibPdf",
                "ENCrossToolbox"
            ]
        )
    ],
    targets: [
        .binaryTarget(
            name: "ENMobileCoreSDK",
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENMobileCoreSDK/0.9.0/ENMobileCoreSDK.zip",
            checksum: "0cc899a58921547252d35505a70853debe44af7bb4629371c0b6ed693a61fb50"
        ),
        .binaryTarget(
            name: "ENMobileSetupSDK",
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENMobileSetupSDK/0.9.0/ENMobileSetupSDK.zip",
            checksum: "9163da5a2588edb0dea91f300a6531f5eccb4f72651888cb77200645a9a7f59c"
        ),
        .binaryTarget(
            name: "ENMobileSignatureSDK",
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENMobileSignatureSDK/0.9.0/ENMobileSignatureSDK.zip",
            checksum: "c6db14f692fd61c12886f3b26e5e6dfe6048c9386a235fb64adb1d80dee0b3ee"
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
