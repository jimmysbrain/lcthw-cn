$ make clean
rm -rf build src/libex29.o tests/libex29_tests
rm -f tests/tests.log 
find . -name "*.gc*" -exec rm {} \;
rm -rf `find . -name "*.dSYM" -print`
$ make
cc -g -O2 -Wall -Wextra -Isrc -rdynamic -DNDEBUG  -fPIC   -c -o src/libex29.o src/libex29.c
src/libex29.c: In function ‘fail_on_purpose’:
src/libex29.c:42: warning: unused parameter ‘msg’
ar rcs build/libYOUR_LIBRARY.a src/libex29.o
ranlib build/libYOUR_LIBRARY.a
cc -shared -o build/libYOUR_LIBRARY.so src/libex29.o
cc -g -O2 -Wall -Wextra -Isrc -rdynamic -DNDEBUG  build/libYOUR_LIBRARY.a    tests/libex29_tests.c   -o tests/libex29_tests
sh ./tests/runtests.sh
Running unit tests:
----
RUNNING: ./tests/libex29_tests
ALL TESTS PASSED
Tests run: 4
tests/libex29_tests PASS

$
