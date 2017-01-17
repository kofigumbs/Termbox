public enum Event {

    case key(Key)
    case resize(width: UInt, height: UInt)
    case mouse(Mouse, x: UInt, y: UInt)
    case error

    /*
     * TODO: Modifiers
     * https://github.com/nsf/termbox/blob/master/src/termbox.h#L127-L129
     *
     */

    static func from(type: Int32, key: UInt16, ch: UInt32, w: Int32, h: Int32, x: Int32, y: Int32) -> Event {
        let parsed: () -> Event? = {
            switch type {
            case 1:
                return Key.from(key: key, ch: ch).map { .key($0) }
            case 2:
                return .resize(width: UInt(w), height: UInt(h))
            case 3:
                return Mouse.from(key: key).map { .mouse($0, x: UInt(x), y: UInt(y)) }
            default:
                return nil
            }
        }

        return parsed() ?? .error
    }

}
