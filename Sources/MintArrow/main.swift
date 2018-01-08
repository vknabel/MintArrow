import ArrowKit
import MintKit
import PathKit

struct MintArrow: Arrow {
    let arrow: String
    let help: String?
    let package: String
    let executableName: String?
    let arguments: [String]?
    let verbose: Bool?
    let packageVersion: String?
    let cachePath: String?

    func fire(archerfile _: Archerfile, arguments: [String]) throws {
        let mint: Mint = Mint(path: Path(cachePath ?? "./.archery/mint"))
        try mint.run(
            mintPackage(),
            arguments: (self.arguments ?? []) + arguments,
            verbose: verbose ?? false
        )
    }

    func mintPackage() -> MintKit.Package {
        return Package(
            repo: package,
            version: packageVersion ?? "master",
            name: executableName ?? package.split(separator: "/").last.map(String.init) ?? package
        )
    }
}

MintArrow.fire()
