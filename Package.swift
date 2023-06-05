// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Tofu",
  products: [
    .library(
      name: "Tofu",
      targets: ["Tofu"]),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Tofu",
      dependencies: []),
    .testTarget(
      name: "TofuTests",
      dependencies: ["Tofu"]),
  ])
