# Swift General Utility

Support code for developing Swift code.

## Contents

### Applicative

Inline functional `Applicative` protocol that supports applying a closure to an instance, returning the instance. 

*Note:* Types must conform to the protocol to inherit the behavior, as non-nominal types like `Any` cannot be extended.

### Execute

Run a system command with `Process` and return the contents of stdout or throw stderr for non-zero status. Although you may call this with either a single string or (cmd-path, argument-array), the latter approach is preferred.

### Result utility

Initializes a `Result` from a completion handler's `(data?, error?)`.

### RuntimeError

A stringity error type representing runtime errors.

### Side effect utility

Enables debugging within method chains and condition cascades.

### StringUtility

`String` utilities.

### SynchronousData

Request synchronous data using `URLSession`.

### Utility

A `Utility` namespace for hosting utility functionality withing your app.

## Installation

PROJECT > Swift Packages > Install:

```
https://github.com/erica/https://github.com/erica/Swift-General-Utility
```

SwiftPM:

```
dependencies: [
    .package(url: "https://github.com/erica/Swift-General-Utility", from: "0.0.1"),
],
targets: [
    .target(
        name: "TARGET-NAME",
        dependencies: [
           .product(name: "GeneralUtility"),
        ],
    ),
],
```

