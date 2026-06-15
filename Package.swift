// swift-tools-version: 5.10

import PackageDescription

let package = Package(
  name: "swift-ai",
  platforms: [
    .iOS(.v17),
    .macOS(.v14),
    .tvOS(.v17),
    .watchOS(.v10),
    .macCatalyst(.v17),
  ],
  products: [
    .library(name: "SwiftAI", targets: ["SwiftAI"]),
    .library(name: "SwiftAIMLX", targets: ["SwiftAIMLX"]),
  ],
  dependencies: [
    .package(url: "https://github.com/swiftlang/swift-syntax.git", from: "510.0.0"),
    .package(url: "https://github.com/swiftlang/swift-format.git", from: "510.0.0"),
    .package(url: "https://github.com/MacPaw/OpenAI.git", exact: "0.4.7"),
    .package(url: "https://github.com/ml-explore/mlx-swift-examples.git", from: "2.25.6"),
    .package(url: "https://github.com/apple/swift-collections.git", from: "1.3.0"),
  ],
  targets: [
    .target(
      name: "SwiftAI",
      dependencies: [
        .product(name: "OpenAI", package: "OpenAI"),
        .product(name: "OrderedCollections", package: "swift-collections"),
      ]
    ),
    .target(
      name: "SwiftAIMLX",
      dependencies: [
        "SwiftAI",
        .product(name: "MLXLMCommon", package: "mlx-swift-examples"),
        .product(name: "MLXLLM", package: "mlx-swift-examples"),
      ]
    ),
    .testTarget(
      name: "SwiftAITests",
      dependencies: ["SwiftAI"]
    ),
    .testTarget(
      name: "SwiftAIMLXTests",
      dependencies: ["SwiftAIMLX", "SwiftAI"]
    ),
  ]
)
