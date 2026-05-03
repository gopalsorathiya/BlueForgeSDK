// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "NovybleEngine",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "NovybleEngine",
            targets: ["NovybleEngine"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "NovybleEngine",
            url: "https://github.com/gopalsorathiya/NovybleSDK/releases/download/1.1.4/NovybleEngine.xcframework.zip",
            checksum: "729a16de3a9063b1eb1ec0a25b39b684420790f34e1cf94ea4e9de03a3a90c56"
        )
    ]
)
