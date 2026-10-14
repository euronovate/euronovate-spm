// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "ENMobileSDK",
    platforms: [
        .iOS(.v15)
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
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENMobileCoreSDK/1.0.0/ENMobileCoreSDK.zip",
            checksum: "fd83dbfd8fb7cc5f45f388e80d87d047dde12efa68625514fcdb26cdb73f841b"
        ),
        .binaryTarget(
            name: "ENMobileSetupSDK",
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENMobileSetupSDK/1.0.0/ENMobileSetupSDK.zip",
            checksum: "8dd30ae5840166283d745cefb62c013dbd72f7adbc4e6983de1aa3063b184c5c"
        ),
        .binaryTarget(
            name: "ENMobileSignatureSDK",
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENMobileSignatureSDK/1.0.0/ENMobileSignatureSDK.zip",
            checksum: "9d1fe333a89b1bccdfdb763bfe5dff42cff961d11d7ba62d4a6c0edfa4f772e2"
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
