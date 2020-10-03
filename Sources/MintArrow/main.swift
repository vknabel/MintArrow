import ArrowKit
import Foundation
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
    let installationPath: String?

    func fire(archerfile _: Archerfile, arguments: [String]) throws {
        let mint = Mint(
            path: Path(cachePath ?? "./.archery/mint"),
            linkPath: Path(installationPath ?? ProcessInfo.processInfo.environment["MINT_LINK_PATH"] ?? "./.archery/bin")
        )
        mint.verbose = verbose ?? false
        try mint.run(
            package: mintPackage(),
            arguments: (self.arguments ?? []) + arguments
        )
    }

    func mintPackage() -> MintKit.PackageReference {
        return PackageReference(
            repo: package,
            version: packageVersion ?? "master"
        )
    }
}

MintArrow.fire()
