import Foundation

open class Tofu {
  private var loggerLevel: TofuLevel

  init(level: TofuLevel = TofuLevel.Debug) { self.loggerLevel = level }

  public func setLevel(to level: TofuLevel) {
    loggerLevel = level
  }

  public final class func == (lhs: Tofu, rhs: Tofu) -> Bool {
    return lhs.loggerLevel == rhs.loggerLevel
  }

  open func logFormat(level: TofuLevel, _ message: @autoclosure @escaping () -> String, file: String = #file, function: String = #function, line: UInt = #line) {
    print("[\(level.rawValue)] \(function):\(line) \(message())")
  }

  @inlinable
  open func err(_ message: @autoclosure @escaping () -> String, file: String = #file, function: String = #function, line: UInt = #line) {
    logFormat(level: TofuLevel.Err, message())
  }

  @inlinable
  open func warn(_ message: @autoclosure @escaping () -> String, file: String = #file, function: String = #function, line: UInt = #line) {
    logFormat(level: TofuLevel.Warn, message())
  }

  @inlinable
  open func debug(_ message: @autoclosure @escaping () -> String, file: String = #file, function: String = #function, line: UInt = #line) {
    logFormat(level: TofuLevel.Debug, message())
  }

  @inlinable
  open func log(level: TofuLevel, _ message: @autoclosure @escaping () -> String, file: String = #file, function: String = #function, line: UInt = #line) {
    logFormat(level: TofuLevel.Log, message())
  }
}
