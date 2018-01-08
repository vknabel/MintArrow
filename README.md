# 🏹 Mint Arrow


Run CLIs written in Swift using Mint.
For more information about Archery itself head to [vknabel/Archery](https://github.com/vknabel/Archery).


```json
{
    "name": "SupercoolProject",
    "version": "1.0.0",
    "scripts": {
        "lint": {
            "arrow": "vknabel/MintArrow",
            "package": "Realm/Swiftlint",
            "verbose": true,
            "arguments": ["lint", "--path", "Sources"]
        }
    }
}
```

If there is no Archery arrow implementation for a Swift tool, you can wrap it using Mint Arrow. Mint and Arrow will handle your dependencies.
```bash
$ archery lint
Linting Swift files at path Sources
Linting 'main.swift' (1/1)
Done linting! Found 0 violations, 0 serious in 1 file.
```


## Available Options

| Name | Type | Default |
|------|------|---------|
| package | `String` | Required |
| executableName | `String?` | Repository name |
| arguments | `[String]?` | `[]`, arguments passed to the tool |
| verbose | `Bool?` | `false` |
| packageVersion | `String?` | `master` |
| cachePath | `String?` | `./.archery/mint` |

## Contributors
* Valentin Knabel, [@vknabel](https://github.com/vknabel), dev@vknabel.com, [@vknabel](https://twitter.com/vknabel) on Twitter


## License
Archery is available under the [](https://github.com/vknabel/archery/master/LICENSE) license.
