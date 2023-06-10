import XCTest

@testable import Tofu

final class TofuTests: XCTestCase {
  func testLogLevels() throws {
    let logger = Tofu(level: TofuLevel.Debug)
    let loggerOther = Tofu(level: TofuLevel.Debug)

    XCTAssertTrue(logger == loggerOther)
  }

  func testTofuLevelOrder() throws {
    XCTAssertTrue(TofuLevel.Err > TofuLevel.Debug)
  }

  func testLog() throws {
    let logger = Tofu()
    logger.debug("Test String")
  }

  func testLogFile() throws {
    let fileChecker = FileManager()

    let output = "/Users/gweithio/log.txt"

    let logger = Tofu(output: output)
    logger.debug("File Logged")

    XCTAssertTrue(fileChecker.fileExists(atPath: output))
  }
}
