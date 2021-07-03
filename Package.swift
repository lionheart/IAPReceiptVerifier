// swift-tools-version:5.3

//
//  Package.swift
//  IAPReceiptVerifier
//
//  Created by Mark Hoath on 3/7/21.
//

import PackageDescription

let package = Package (
    name: "IAPReceiptVerifier",
    platforms: [
            .iOS(.v14)
        ],
    products: [
            // Products define the executables and libraries a package produces, and make them visible to other packages.
            .library(
                name: "IAPReceiptVerifier",
                targets: ["IAPReceiptVerifier"])
        ],
    dependencies: [
            // Dependencies declare other packages that this package depends on.
    ],
    targets: [
            // Targets are the basic building blocks of a package. A target can define a module or a test suite.
            // Targets can depend on other targets in this package, and on products in packages this package depends on.
            .target(
                name: "IAPReceiptVerifier",
                dependencies: [],
                path: "IAPReceiptVerifier/Classes")
    ]
)
