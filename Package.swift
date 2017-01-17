import PackageDescription

let package = Package(
    name: "Termbox",
    targets: [
        Target(name: "CTermbox"),
        Target(name: "Termbox", dependencies: [ .Target(name: "CTermbox") ])
    ]
)
