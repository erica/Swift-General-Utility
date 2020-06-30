# Swift General Utility

Support code for developing Swift code.

## Contents

### Utility

A `Utility` namespace for hosting utility functionality withing your app.

### Applicative

Inline functional `Applicative` protocol that supports applying a closure to an instance, returning the instance. 

*Note:* Types must conform to the protocol to inherit the behavior, as non-nominal types like `Any` cannot be extended.

### RuntimeError

A stringity error type representing runtime errors.

### Side effect utility

Enables debugging within method chains and condition cascades.

### SynchronousData

Request synchronous data using `URLSession`.

### Type Utilities

#### Collection utility

* Partition split.

#### Result utility

* Initializes a `Result` from a completion handler's `(data?, error?)`.

#### String utility

* Trim a string


## Installation

PROJECT > Swift Packages > Install:

```
https://github.com/erica/https://github.com/erica/Swift-General-Utility
```

SwiftPM:

```
dependencies: [
.package(url: "https://github.com/erica/Swift-General-Utility", from: "x.x.x"), // replace with version
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
