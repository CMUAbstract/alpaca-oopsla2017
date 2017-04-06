RSA application written in Alpaca
========================================

This app encrypts arbitrary string using designated key.

Build:

	$ make bld/gcc/depclean
	$ make bld/gcc/dep
	$ make bld/alpaca/depclean
	$ make bld/alpaca/dep
	$ make bld/alpaca/all

Flash:

	$ make bld/alpaca/prog
