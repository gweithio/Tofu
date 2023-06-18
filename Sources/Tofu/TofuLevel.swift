import Foundation

protocol TofuLevelRaw {
    var rawValue: String { get }
}

@frozen
public enum TofuLevel: TofuLevelRaw, TofuOperators {
    case Critical
    case Err
    case Warn
    case Debug
    case Log

    public var rawValue: String {
        switch self {
        case .Critical: return "Critical"
        case .Err: return "Err"
        case .Warn: return "Warn"
        case .Debug: return "Debug"
        case .Log: return "Log"
        }
    }

    public static func < (lhs: TofuLevel, rhs: TofuLevel) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }

    public static func > (lhs: TofuLevel, rhs: TofuLevel) -> Bool {
        return lhs.rawValue > rhs.rawValue
    }

    public static func == (lhs: TofuLevel, rhs: TofuLevel) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}
