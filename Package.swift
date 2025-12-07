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
      ],
      path: "Sources"
    ),
    .binaryTarget(
      name: "MobileVLCKit",
      url: "https://github.com/harflabs/VLC/releases/download/3.7.0/MobileVLCKit.zip",
      checksum: "c56b6eac4330643fbdf0362ea1d932ef7e8f726db1e6db0b5a72edc7d9e5515f"
    ),
    .binaryTarget(
      name: "TVVLCKit",
      url: "https://github.com/harflabs/VLC/releases/download/3.7.0/TVVLCKit.zip",
      checksum: "612279478c5d4557cccadffb9db99bcefdeef1e14b3ed45fe3e5302d7397f247"
    ),
    .binaryTarget(
      name: "VLCKit",
      url: "https://github.com/harflabs/VLC/releases/download/3.7.0/VLCKit.zip",
      checksum: "8db074f2e3bc25aa2b4c25e65acb921e71ed93a59fc35082b6671359a21ade90"
    ),
  ]
)
