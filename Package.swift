// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "ShadcnDaisyUI",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
    ],
    products: [
        .library(name: "ShadcnDaisyUI", targets: ["ShadcnDaisyUI"])
    ],
    targets: [
        .target(
            name: "ShadcnDaisyUI",
            resources: [.copy("Resources/design-guidelines.md")]
        ),
        .testTarget(
            name: "ShadcnDaisyUITests",
            dependencies: ["ShadcnDaisyUI"]
        ),
    ]
)
