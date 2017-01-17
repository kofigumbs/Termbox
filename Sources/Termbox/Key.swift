public enum Key {

    case f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12,
        insert, delete, home, end, pageUp, pageDown,
        arrowUp, arrowDown, arrowLeft, arrowRight, enter,
        unicode(UnicodeScalar)

    /*
     * TODO: CTRL codes
     * https://github.com/nsf/termbox/blob/master/src/termbox.h#L51-L95
     *
     */

    /*
     * TODO: ALT + mouse modifiers
     * https://github.com/nsf/termbox/blob/master/src/termbox.h#L105-L109
     *
     */

    static func from(key: UInt16, ch: UInt32) -> Key? {
        switch key {
        case 0xFFFF-0:
            return .f1
        case 0xFFFF-1:
            return .f2
        case 0xFFFF-2:
            return .f3
        case 0xFFFF-3:
            return .f4
        case 0xFFFF-4:
            return .f5
        case 0xFFFF-5:
            return .f6
        case 0xFFFF-6:
            return .f7
        case 0xFFFF-7:
            return .f8
        case 0xFFFF-8:
            return .f9
        case 0xFFFF-9:
            return .f10
        case 0xFFFF-10:
            return .f11
        case 0xFFFF-11:
            return .f12
        case 0xFFFF-12:
            return .insert
        case 0xFFFF-13:
            return .delete
        case 0xFFFF-14:
            return .home
        case 0xFFFF-15:
            return .end
        case 0xFFFF-16:
            return .pageUp
        case 0xFFFF-17:
            return .pageDown
        case 0xFFFF-18:
            return .arrowUp
        case 0xFFFF-19:
            return .arrowDown
        case 0xFFFF-20:
            return .arrowLeft
        case 0xFFFF-21:
            return .arrowRight
        case 0x0D:
            return .enter
        default:
            return UnicodeScalar(ch).map { .unicode($0) }
        }
    }

}
