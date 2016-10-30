public enum Event {

    case key(Key)
    case resize(width: UInt, height: UInt)
    case mouse(Mouse, x: UInt, y: UInt)

    struct FailedToPoll: Error {}

    /*
     * TODO: Modifiers
     * https://github.com/nsf/termbox/blob/master/src/termbox.h#L127-L129
     *
     */

    static func from(type: Int32, key: UInt16, ch: UInt32, w: Int32, h: Int32, x: Int32, y: Int32) throws -> Event {
        switch type {
        case 1:
            return try .key(err(Key.from(key: key, ch: ch)))
        case 2:
            return .resize(width: UInt(w), height: UInt(h))
        case 3:
            return try .mouse(err(Mouse.from(key: key)), x: UInt(x), y: UInt(y))
        default:
            throw FailedToPoll()
        }
    }

    private static func err<A>(_ maybe: A?) throws -> A {
        guard let a = maybe else { throw FailedToPoll() }
        return a
    }

}
