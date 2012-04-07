$ ps ax | grep ex31
10026 s000  S+     0:00.11 ./ex31
10036 s001  R+     0:00.00 grep ex31

$ gdb ./ex31 10026
GNU gdb 6.3.50-20050815 (Apple version gdb-1705) (Fri Jul  1 10:50:06 UTC 2011)
Copyright 2004 Free Software Foundation, Inc.
GDB is free software, covered by the GNU General Public License, and you are
welcome to change it and/or distribute copies of it under certain conditions.
Type "show copying" to see the conditions.
There is absolutely no warranty for GDB.  Type "show warranty" for details.
This GDB was configured as "x86_64-apple-darwin"...Reading symbols for shared libraries .. done

/Users/zedshaw/projects/books/learn-c-the-hard-way/code/10026: No such file or directory
Attaching to program: `/Users/zedshaw/projects/books/learn-c-the-hard-way/code/ex31', process 10026.
Reading symbols for shared libraries + done
Reading symbols for shared libraries ++........................ done
Reading symbols for shared libraries + done
0x00007fff862c9e42 in __semwait_signal ()

(gdb) break 8
Breakpoint 1 at 0x107babf14: file ex31.c, line 8.

(gdb) break ex31.c:11
Breakpoint 2 at 0x107babf1c: file ex31.c, line 12.

(gdb) cont
Continuing.

Breakpoint 1, main (argc=1, argv=0x7fff677aabd8) at ex31.c:8
8	    while(i < 100) {

(gdb) p i
$1 = 0

(gdb) cont
Continuing.

Breakpoint 1, main (argc=1, argv=0x7fff677aabd8) at ex31.c:8
8	    while(i < 100) {

(gdb) p i
$2 = 0

(gdb) list
3	
4	int main(int argc, char *argv[])
5	{
6	    int i = 0;
7	
8	    while(i < 100) {
9	        usleep(3000);
10	    }
11	
12	    return 0;

(gdb) set var i = 200

(gdb) p i
$3 = 200

(gdb) next

Breakpoint 2, main (argc=1, argv=0x7fff677aabd8) at ex31.c:12
12	    return 0;

(gdb) cont
Continuing.

Program exited normally.
(gdb) quit
$ 
