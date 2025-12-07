// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "VLC",
  platforms: [
    .iOS(.v17),
    .tvOS(.v17),
    .macOS(.v14),
  ],
  products: [
    .library(
      name: "VLC",
      targets: [
        "VLC",
      ]
    ),
  ],
  targets: [
    .target(
      name: "VLC",
      dependencies: [
        .target(name: "MobileVLCKit", condition: .when(platforms: [.iOS])),
        .target(name: "TVVLCKit", condition: .when(platforms: [.tvOS])),
        .target(name: "VLCKit", condition: .when(platforms: [.macOS])),
      ],
      path: "Sources",
      linkerSettings: [
        .linkedFramework("MobileVLCKit", .when(platforms: [.iOS])),
        .linkedFramework("TVVLCKit", .when(platforms: [.tvOS])),
        .linkedFramework("VLCKit", .when(platforms: [.macOS])),
      ]
    ),
    .binaryTarget(
      name: "MobileVLCKit",
      url: "https://github.com/harflabs/VLC/releases/download/3.7.0/MobileVLCKit.zip",
      checksum: "5bc436aeb94f765a22d103dd101979ace1ed81c5fef1460e2785ba1093699d97"
    ),
    .binaryTarget(
      name: "TVVLCKit",
      url: "https://github.com/harflabs/VLC/releases/download/3.7.0/TVVLCKit.zip",
      checksum: "46d47370d868f4da00971c68941754fdb45d304cccff3cb58e8978e57075dc4c"
    ),
    .binaryTarget(
      name: "VLCKit",
      url: "https://github.com/harflabs/VLC/releases/download/3.7.0/VLCKit.zip",
      checksum: "b73618a24b19c921f1c6f3a365ade7bc9d2eafd6d995bdd5534432c3effd2f52"
    ),
  ]
)
