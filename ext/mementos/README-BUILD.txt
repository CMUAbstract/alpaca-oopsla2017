TODO: integrate this into the main readme

These are notes from using mementos with LLVM v3.8 and GGC v4.9 (successor of
mspgcc).

$ autoconf/AutoRegen.sh
$ ./configure --with-gcc=/path/to/ti/msp430-gcc --prefix=/path/to/llvm/install

Build LLVM passes:
 cmake -DCMAKE_BUILD_TYPE="Debug" -DCMAKE_CXX_FLAGS="-std=c++11"  -DCMAKE_PREFIX_PATH=/home/acolin/rs/src/llvm/llvm-install -DCMAKE_INSTALL_PREFIX=/home/acolin/rs/src/llvm/llvm-install -DCMAKE_MODULE_PATH=/home/acolin/rs/src/llvm/llvm-install/share/llvm/cmake .

Build the runtime library (Clang bytecode) :
make MCU=msp430fr5969 FRAM=1 mementos+<mode>.bc
where <mode> is latch,return,timer+latch,oracle

Note that with GCC v4.9 (as opposed to the deprecated mspgcc), the only config
found to work is when the runtime lib is built with Clang and linked with the
Clang-built app by the Clang linker (followed by, as usual, the result compiled
to native assembly with llc and assembed by to GCC). Building the Mementos
runtime with GCC and linking with the Clang-built app succeeds, but the
restore-from-checkpoint does not work.
