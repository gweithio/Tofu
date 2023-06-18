public protocol TofuOperators {
    static func < (lhs: Self, rhs: Self) -> Bool
    static func > (lhs: Self, rhs: Self) -> Bool
    static func == (lhs: Self, rhs: Self) -> Bool
}
