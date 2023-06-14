<div id="header">
    <p align="center">
      <b>Tofu 🧈</b><br>
        <span font-size="16px">a little logger for Swift.</span><br>
      <span font-size="12px">Made by <a href="http://gweithio.com">Ethan</a> with love.</span><br><br>
      <span><a href="https://www.twitter.com/glassofethanol">Twitter</a> | <a href="https://github.com/sponsors/gweithio">Support</a></span><br><br>
    </p>
</div>

## Features

- Supports Critical, Error, Warn, Debug, Log
- Appends results to a file (must be absolute path no '`~/`')

## Quick Start

Simply add to your `Package.swift`

```swift
.package(name: "Tofu", url: "https://github.com/gweithio/tofu", .branch("main"))
```

## Examples

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
