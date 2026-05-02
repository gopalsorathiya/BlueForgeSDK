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
            url: "https://github.com/gopalsorathiya/BlueForgeSDK/releases/download/1.0.0/NovybleEngine.xcframework.zip",
            checksum: "4e7ff1f6e08138bf6a9f6ebcb1cef59a92cc8a377ed56bf149cb306032a0a3d5"
        )
    ]
)
