@testable import Tofu

import XCTest

final class TofuTests: XCTestCase {
  func testLogLevels() throws {
    let logger = Tofu(level: TofuLevel.Debug)
    let loggerOther = Tofu(level: TofuLevel.Debug)

    XCTAssertTrue(logger == loggerOther)
  }

  func testTofuLevelOrder() throws {
    XCTAssertTrue(TofuLevel.Err > TofuLevel.Debug)
  }
}
