// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Node",
  products: [
    .library(
      name: "Node",
      targets: ["Node"]
    ),
  ],
  targets: [
    .target(
      name: "Node"
    ),
    .testTarget(
      name: "NodeTests",
      dependencies: ["Node"]
    ),
  ]
)
