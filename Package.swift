import PackageDescription

let package = Package(
    name: "Termbox",
    dependencies: [
        .Package(url: "https://github.com/hkgumbs/CTermbox", Version(0, 1, 0))
    ]
)
