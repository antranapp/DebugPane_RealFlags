// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "DebugPane_RealFlags",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "DebugPane_RealFlags",
            targets: ["DebugPane_RealFlags"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/antranapp/DebugPane", .branch("master")),
        .package(url: "https://github.com/antranapp/RealFlags", .branch("no_firebase")),
    ],
    targets: [
        .target(
            name: "DebugPane_RealFlags",
            dependencies: [
                "RealFlags",
                "DebugPane",
            ]
        ),
        .testTarget(
            name: "DebugPane_RealFlagsTests",
            dependencies: ["DebugPane_RealFlags"]
        ),
    ]
)
