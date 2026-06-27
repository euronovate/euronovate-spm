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
                .target(name: "ENMobileCoreAuxiliaryTarget")
            ],
            path: "ENMobileSignature"
        ),
        .binaryTarget(
            name: "ENMobileCoreSDK",
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENMobileCoreSDK/0.9.0/ENMobileCoreSDK.zip",
            checksum: "0f0f5eacd60afa0195c18b5461d147c6db1543961eb024b45745f94fc4e8764c"
        ),
        .binaryTarget(
            name: "ENMobileSetupSDK",
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENMobileSetupSDK/0.9.0/ENMobileSetupSDK.zip",
            checksum: "4786bbf608258bd06aadd99634b1623aa892e5b016642b1593eb6a32c065d60d"
        ),
        .binaryTarget(
            name: "ENMobileSignatureSDK",
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENMobileSignatureSDK/0.9.0/ENMobileSignatureSDK.zip",
            checksum: "ea315194964171490a18d1ca446dce171f85e3b1db53847a4cf92558d2ce55a1"
        )
    ]
)
