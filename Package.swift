// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "TagCloud",
  platforms: [.iOS(.v13)],
  products: [
    .library(
      name: "TagCloud",
      targets: ["TagCloud"]),
  ],
  targets: [
    .target(
      name: "TagCloud",
      dependencies: []),
    .testTarget(
      name: "TagCloudTests",
      dependencies: ["TagCloud"]),
  ]
)
