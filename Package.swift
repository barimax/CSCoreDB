// swift-tools-version:4.2
// Generated automatically by Perfect Assistant
// Date: 2019-08-19 11:54:55 +0000
import PackageDescription

let package = Package(
	name: "CSCoreDB",
	products: [
		.library(name: "CSCoreDB", targets: ["CSCoreDB"])
	],
	dependencies: [
		.package(url: "https://github.com/PerfectlySoft/Perfect-CRUD.git", "1.0.0"..<"2.0.0"),
		.package(url: "https://github.com/iamjono/JSONConfig.git", "3.0.0"..<"4.0.0"),
		.package(url: "https://github.com/PerfectlySoft/Perfect-MySQL.git", "3.0.0"..<"4.0.0")
	],
	targets: [
		.target(name: "CSCoreDB", dependencies: []),
		.testTarget(name: "CSCoreDBTests", dependencies: ["CSCoreDB"])
	]
)