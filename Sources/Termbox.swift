import CTermbox

public class Termbox {

    /// Initializes the termbox library.
    public init() {
        tb_init()
    }

    /*
     * TODO: init with file
     * https://github.com/nsf/termbox/blob/master/src/termbox.h#L256-L297
     *
     */

    deinit {
        tb_shutdown()
    }

    /// Size of the internal back buffer (which is the same as
    /// terminal's window size in characters). The internal buffer can be resized
    /// after clear() or present() function calls.
    public var size: (width: UInt, height: UInt) {
        return (width: UInt(tb_width()), height: UInt(tb_height()))
    }

    /// Changes cell's parameters in the internal back buffer at the specified
    /// position.
    public func change(x: UInt, y: UInt, cell: Cell) {
        tb_change_cell(Int32(x), Int32(y), UInt32(cell.character), cell.foreground.uint16, cell.background.uint16)
    }

    /// Synchronizes the internal back buffer with the terminal.
    public func present() {
        tb_present()
    }

    /// Clears the internal back buffer using `Color.none`.
    public func clear() {
        tb_clear()
    }

    /// Sets the position of the cursor.
    public func moveCursorTo(x: UInt, y: UInt) {
        tb_set_cursor(Int32(x), Int32(y))
    }

    /// Hides cursor. Cursor is hidden by default.
    public func hideCursor() {
        tb_set_cursor(Int32(-1), Int32(-1))
    }

    /// Wait for an event forever.
    public func poll() throws -> Event {
        let cEvent = UnsafeMutablePointer<tb_event>.allocate(capacity: 1)
        let type = tb_poll_event(cEvent)
        let event = try Event.from(
           type: type,
           key:  cEvent.pointee.key,
           ch:   cEvent.pointee.ch,
           w:    cEvent.pointee.w,
           h:    cEvent.pointee.h,
           x:    cEvent.pointee.x,
           y:    cEvent.pointee.y
        )

        cEvent.deallocate(capacity: 1)
        return event
    }

    /*
     * TODO: peek
     * https://github.com/nsf/termbox/blob/master/src/termbox.h#L299-L304
     *
     */

    /*
     * TODO: selectInputMode
     * https://github.com/nsf/termbox/blob/master/src/termbox.h#L231-L254
     *
     */

    /*
     * TODO: selectOutputMode
     * https://github.com/nsf/termbox/blob/master/src/termbox.h#L256-L297
     *
     */

}
