public enum Mouse {

    case leftClick, rightClick, middleClick, releaseClick,
        wheelUp, wheelDown

    static func from(key: UInt16) -> Mouse? {
        switch key {
        case 0xFFFF-22:
            return .leftClick
        case 0xFFFF-23:
            return .rightClick
        case 0xFFFF-24:
            return .middleClick
        case 0xFFFF-25:
            return .releaseClick
        case 0xFFFF-26:
            return .wheelUp
        case 0xFFFF-27:
            return .wheelDown
        default:
            return nil
        }
    }

}
