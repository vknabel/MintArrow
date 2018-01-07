import MintKit
import ArrowKit

struct MintArrow: Arrow {
    let arrow: String
    let help: String?
    let package: String
    let executableName: String?
    let verbose: Bool?
    let pacakgeVersion: String?

    func fire(archerfile: Archerfile, arguments: [String]) throws {
        let mint: Mint = Mint(path: "./.archery/mint")
        try mint.run(
            package(),
            arguments: arguments,
            verbose: verbose ?? false
        )
    }

    func package() -> MintKit.Package {
        return Package(
            repo: package,
            version: pacakgeVersion ?? "master",
            name: executableName ?? package.split(separator: "/").last.map(String.init) ?? package
        )
    }
}

MintArrow.fire()
