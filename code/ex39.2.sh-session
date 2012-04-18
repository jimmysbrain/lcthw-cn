$ for i in 1 2 3 4 5 6 7 8 9 10; do echo "RUN --- $i" >> times.log; ./tests/string_algos_tests 2>&1 | grep COUNT >> times.log ; done
$ less times.log 
$ vim times.log
