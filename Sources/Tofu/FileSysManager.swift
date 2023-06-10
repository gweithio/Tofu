import Foundation

struct FileSysManager {
  private lazy var manager: FileManager = .default
  private var path: String

  init(path: String) { self.path = path }

  public mutating func createLogFile() -> Bool {
    return !doesLogFileExist()
      && manager.createFile(atPath: path, contents: Data(), attributes: nil)
  }

  public mutating func doesLogFileExist() -> Bool {
    return !path.isEmpty && manager.fileExists(atPath: path)
  }

  public mutating func insertLogMessage(logMessage: inout String) {
    logMessage.append(contentsOf: "\n")

    guard let message = logMessage.data(using: .utf8) else {
      return
    }

    if let fileHandle = FileHandle(forWritingAtPath: path) {
      fileHandle.seekToEndOfFile()
      fileHandle.write(message)
      fileHandle.closeFile()
    }
  }
}
