Building:

1. Build LLVM with CMake.  For the rest of this README we'll assume you've
   installed LLVM at /opt/llvm.

2. Build the Mementos pass with CMake:

    $ mkdir llvm/bld
    $ cd llvm/bld
    $ cmake -DCMAKE_PREFIX_PATH=/opt/llvm -DCMAKE_MODULE_PATH=/opt/llvm/share/llvm/cmake ..
    $ make
