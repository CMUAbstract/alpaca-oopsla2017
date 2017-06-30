make bld/gcc/depclean
make bld/gcc/dep BOARD=$2
make bld/$1/depclean
make bld/$1/dep BOARD=$2
make bld/$1/all BOARD=$2 SRC=$3
mspdebug -v 3300 -d /dev/ttyACM0 tilib "prog bld/$1/$3.out"
echo "TOOL=$1, BOARD=$2, SRC=$3"
