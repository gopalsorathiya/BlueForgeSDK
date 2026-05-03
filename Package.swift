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
            url: "https://github.com/gopalsorathiya/NovybleSDK/releases/download/1.1.5/NovybleEngine.xcframework.zip",
            checksum: "2fe74931c80f8bab76aeb89f4f327bed9419bf4c179f74ef88949e6b14730ecc"
        )
    ]
)
