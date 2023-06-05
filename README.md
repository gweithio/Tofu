# Tofu

**Simple logger, to stdout and to file**

## Features

* Supports Critical, Error, Warn, Debug, Log
* Appends results to a file (must be absolute path no `~/`)

### Quick Start

Simply add to your `Package.swift`

```swift
.package(name: "Tofu", url: "https://github.com/gweithio/tofu", .branch("main"))
```
### Examples

Simple log
```swift
let logger = Tofu()
logger.debug("Hello There!")
```
Out to a file

```swift
let logger = Tofu(output: "/Users/username/log.txt")
logger.debug("Test String")
```
