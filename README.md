Test environment for OOPSLA 2017
========================================

This is an all-in-one environment for testing Alpaca, Chain and DINO (for OOPSLA 2017).

There are 6 apps each, and apps can be selected by the SRC flag.
(SRC={ar, cuckoo, rsa, blowfish, cem, bc}, default is rsa)

Each app can run on either WISP (intermittent power) or MSPTS430 (continuous power).

It can be selected by the BOARD flag. 
(BOARD={wisp, mspts430}, default is mspts430).

To run it on device, you should flash it using MSP-FET. To see output (UART), you should
connect UART to your PC. For it to print UART on wisp, you need EDB.

Automatically, if you use mspts430, internal timer is used to measure run time. To measure
runtime on wisp, again EDB is a nice choice.

To do accurate run time measurement, remove all PRINTFs.

We offer compile.sh and compile_and_run.sh file for easy build and flash. 

Compile using compile.sh and flash manually (recommanded for mspts430):

	$ ./compile.sh {alpaca,chain,dino} {wisp,mspts430} {ar,cuckoo,rsa,blowfish,cem,bc}
	$ mspdebug -v 3300 -d /dev/ttyACM0 tilib
	$ prog bld/{alpaca,chain,dino}/{ar.cuckoo,rsa,blowfish,cem,bc}.out
	$ run

Compile and run (recommended for WISP):

	$ ./compile_and_run.sh {alpaca,chain,dino} {wisp,mspts430} {ar,cuckoo,rsa,blowfish,cem,bc}


*If you are using mspts430 and want to use UART, MSP-FET has a bug so that sometimes it fails to
flash with UART connected. Use compile.sh and connect UART right before hitting run.
For WISP, use compile_and_run.sh for simplicity.

You can also manually compile and flash as follows.

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

Do not forget to build ext/alpaca/LLVM before running. See the README inside that folder.
