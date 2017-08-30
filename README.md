Test environment of Alpaca for OOPSLA 2017
==========================================

This is an all-in-one environment for testing Alpaca, Chain and DINO (for OOPSLA 2017).

0. Prior to testing, build ext/alpaca/LLVM. Follow the README inside the folder, or, if you are using provided VM, do the following.

(under LLVM folder):

	$ mkdir build
	$ cd build
	$ LLVM_DIR=/opt/llvm/llvm-install/share/llvm/cmake cmake ..
	$ make



1. To build apps and run, under alpaca-oopsla2017 dir, do the following.

Compile app and flash manually (recommanded for mspts430):

	$ ./compile.sh {alpaca,chain,dino} {wisp,mspts430} {ar,cuckoo,rsa,blowfish,cem,bc}
	$ mspdebug -v 3300 -d /dev/ttyACM0 tilib
	$ prog bld/{alpaca,chain,dino}/{ar.cuckoo,rsa,blowfish,cem,bc}.out
	$ run

Compile and run all in once (recommended for WISP):

	$ ./compile_and_run.sh {alpaca,chain,dino} {wisp,mspts430} {ar,cuckoo,rsa,blowfish,cem,bc}



2. Alternatively, you can do every step manually without using the script.

Build:

	$ make bld/gcc/depclean BOARD={wisp,mspts430}
	$ make bld/gcc/dep BOARD={wisp,mspts430}
	$ make bld/{alpaca,chain,dino}/depclean BOARD={wisp,mspts430}
	$ make bld/{alpaca,chain,dino}/dep BOARD={wisp,mspts430}
	$ make bld/{alpaca,chain,dino)/all BOARD={wisp,mspts430} SRC={ar,cuckoo,rsa,blowfish,cem,bc}

Flash:

	$ mspdebug -v 3300 -d /dev/ttyACM0 tilib
	$ prog bld/{alpaca,chain,dino}/{ar.cuckoo,rsa,blowfish,cem,bc}.out
	$ run



3. Detailed explanation

There are 6 apps each, and apps can be selected by the SRC flag.
(SRC={ar, cuckoo, rsa, blowfish, cem, bc}, default is rsa)

Each app can run on either WISP or MSPTS430 (clamshell board).

It can be selected by the BOARD flag. 
(BOARD={wisp, mspts430}, default is mspts430).

The system is assuming WISP runs on harvested energy and MSPTS430 runs on continuous energy.
PRINTF and timer is affected by this choice, but you can simply change it if your environment is different.

To run it on device, you should flash it using MSP-FET. To see output (UART), you should
connect UART to your PC. For it to print UART on harvested energy, you need EDB.

Internal timer is a good choice for measuring run time on continuous power. 
To measure runtime on harvested energy, again EDB is a nice choice.

To do accurate run time measurement, remove all PRINTFs.

