$ mkdir bstrlib
$ cd bstrlib/
$ unzip ~/Downloads/bstrlib-05122010.zip 
Archive:  /Users/zedshaw/Downloads/bstrlib-05122010.zip
...
$ ls
bsafe.c		bstraux.c	bstrlib.h	bstrwrap.h	license.txt	test.cpp
bsafe.h		bstraux.h	bstrlib.txt	cpptest.cpp	porting.txt	testaux.c
bstest.c	bstrlib.c	bstrwrap.cpp	gpl.txt		security.txt
$ mv bstrlib.h bstrlib.c ../src/lcthw/
$ cd ../
$ rm -rf bstrlib
# make the edits
$ vim src/lcthw/bstrlib.c
$ make clean all
...
$
