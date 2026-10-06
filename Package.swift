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
            checksum: "757f6530612318e037f8053a709e76e0714efcedeaf71a85894fa7fbac90cf68"
        ),
        .binaryTarget(
            name: "ENMobileSetupSDK",
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENMobileSetupSDK/1.0.0/ENMobileSetupSDK.zip",
            checksum: "04928f937ac0f4847ad7736450c30812f728cb05d029018dc431a67c82e0d97f"
        ),
        .binaryTarget(
            name: "ENMobileSignatureSDK",
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENMobileSignatureSDK/1.0.0/ENMobileSignatureSDK.zip",
            checksum: "fcf2aff31dcea608ccda1f8b38abefb217a3e2da088bc84ca0f5e7a38ce9e74b"
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
