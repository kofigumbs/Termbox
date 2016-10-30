# Termbox

Swifty bindings for writing text-based user interfaces



### Usage

TODO - for now, you can look at [this example](https://github.com/hkgumbs/tictactoe-swift)



### Installing

Since this uses C libraries under the hood, you'll run into problems if that library is not installed.

```bash
swift package fetch  # in your project to pull the termbox library
cd Packages/CTermbox*/termbox
./waf configure install
swift build          # should work like normal now
```

If you don't like installing stuff globally, just tell `waf` to install `libtermbox` in the project build directory:
`--prefix=../../../.build/ --libdir=../../../.build/debug`.

If you are distributing your source code, I recommend using [a Makefile like this one](https://github.com/hkgumbs/tictactoe-swift/blob/master/Makefile)
to make the installation super easy!



### Credits

 - [nsf/termbox](https://github.com/nsf/termbox)
