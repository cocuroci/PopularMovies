import ProjectDescription

let project = Project(
    name: "PopularMovies",
    organizationName: "Cocuroci",
    packages: [
        .remote(url: "https://github.com/onevcat/Kingfisher", requirement: .upToNextMajor(from: "7.0.0"))
    ],
    settings: nil,
    targets: [
        .init(
            name: "PopularMovies",
            platform: .iOS,
            product: .app,
            bundleId: "br.com.cocuroci.PopularMovies",
            infoPlist: "PopularMovies/Sources/Info.plist",
            sources: ["PopularMovies/Sources/**"],
            resources: ["PopularMovies/Resources/**"],
            dependencies: [
                .package(product: "Kingfisher")
            ]
        )
    ],
    schemes: []
)
