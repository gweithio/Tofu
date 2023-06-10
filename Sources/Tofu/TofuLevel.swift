import Foundation

public protocol TofuLevelP {
    var rawValue: String { get }
}

@frozen
public enum TofuLevel: TofuLevelP, Comparable {
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

    public static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
