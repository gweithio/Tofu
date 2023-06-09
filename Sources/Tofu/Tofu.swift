import Foundation

open class Tofu: TofuOperators {
    private let logFile: FileManager = .default
    private var loggerLevel: TofuLevel
    private let logFilePathAndName: String

    public required init(level: TofuLevel = TofuLevel.Debug, output fileName: String = "") {
        loggerLevel = level
        logFilePathAndName = fileName
    }

    public func setLevel(to level: TofuLevel) {
        loggerLevel = level
    }

    open func logFormat(
        level: TofuLevel, message: @autoclosure @escaping () -> String, file: String = #file,
        function: String = #function, line: UInt = #line
    ) {
        var fileManager = FileSysManager(path: logFilePathAndName)

        let timestamp = DateFormatter.localizedString(
            from: Date(), dateStyle: .short, timeStyle: .medium
        )
        let functionName = function.components(separatedBy: "(")[0]
        var logMessage = "\(timestamp) [\(level.rawValue) \(functionName):\(line)]: \(message())"

        if fileManager.doesLogFileExist() {
            if fileManager.createLogFile() {
                print("Failed to create file \(logFilePathAndName)")
            } else {
                fileManager.insertLogMessage(logMessage: &logMessage)
            }
        } else {
            fileManager.insertLogMessage(logMessage: &logMessage)
        }

        print(logMessage)
    }

    @inlinable
    open func err(
        _ message: @autoclosure @escaping () -> String, file: String = #file,
        function: String = #function, line: UInt = #line
    ) {
        logFormat(level: TofuLevel.Err, message: message())
    }

    @inlinable
    open func warn(
        _ message: @autoclosure @escaping () -> String, file: String = #file,
        function: String = #function, line: UInt = #line
    ) {
        logFormat(level: TofuLevel.Warn, message: message())
    }

    @inlinable
    open func debug(
        _ message: @autoclosure @escaping () -> String, file: String = #file,
        function: String = #function, line: UInt = #line
    ) {
        logFormat(level: TofuLevel.Debug, message: message())
    }

    @inlinable
    open func log(
        level: TofuLevel, _ message: @autoclosure @escaping () -> String, file: String = #file,
        function: String = #function, line: UInt = #line
    ) {
        logFormat(level: TofuLevel.Log, message: message())
    }

    @inlinable
    open func critical(
        level: TofuLevel, _ message: @autoclosure @escaping () -> String, file: String = #file,
        function: String = #function, line: UInt = #line
    ) {
        logFormat(level: TofuLevel.Critical, message: message())
    }

    private func appendToFile(logMessage: inout String) {
        logMessage.append(contentsOf: "\n")

        let data = logMessage.data(using: .utf8)!

        if let fileHandle = FileHandle(forWritingAtPath: logFilePathAndName) {
            fileHandle.seekToEndOfFile()
            fileHandle.write(data)
            fileHandle.closeFile()
        } else {
            print("Failed to write to \(logFilePathAndName)")
        }
    }

    public final class func == (lhs: Tofu, rhs: Tofu) -> Bool {
        return lhs.loggerLevel == rhs.loggerLevel
    }

    public final class func < (lhs: Tofu, rhs: Tofu) -> Bool {
        return lhs.loggerLevel < rhs.loggerLevel
    }

    public final class func > (lhs: Tofu, rhs: Tofu) -> Bool {
        return lhs.loggerLevel > rhs.loggerLevel
    }
}
