// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "BlueForgeEngine",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "BlueForgeEngine",
            targets: ["BlueForgeEngineWrapper"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "BlueForgeBinary",
            url: "https://github.com/gopalsorathiya/BlueForgeSDK/releases/download/0.0.3/BlueForgeEngine.xcframework.zip",
            checksum: "f746fd92bda2895368a6ee3ab872e8da9f2137f024ba99057e9b3ec16246971e"
        ),
        .target(
            name: "BlueForgeEngineWrapper",
            dependencies: ["BlueForgeBinary"],
            path: "Sources/BlueForgeEngineWrapper"
        )
    ]
)
