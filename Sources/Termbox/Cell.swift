public typealias Cell = (
    character: UnicodeScalar,
    foreground: Color,
    background: Color
)

public enum Color {
    case none, black, red, green, yellow, blue, magenta, cyan, white

    var uint16: UInt16 {
        switch self {
        case .none:
            return UInt16(0x00)
        case .black:
            return UInt16(0x01)
        case .red:
            return UInt16(0x02)
        case .green:
            return UInt16(0x03)
        case .yellow:
            return UInt16(0x04)
        case .blue:
            return UInt16(0x05)
        case .magenta:
            return UInt16(0x06)
        case .cyan:
            return UInt16(0x07)
        case .white:
            return UInt16(0x08)
        }
    }
}
