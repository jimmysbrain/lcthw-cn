$ valgrind --dsymutil=yes --tool=callgrind tests/bstree_tests
...
$ callgrind_annotate callgrind.out.1232 
--------------------------------------------------------------------------------
Profile data file 'callgrind.out.1232' (creator: callgrind-3.7.0.SVN)
--------------------------------------------------------------------------------
I1 cache: 
D1 cache: 
LL cache: 
Timerange: Basic block 0 - 1098689
Trigger: Program termination
Profiled target:  tests/bstree_tests (PID 1232, part 1)
Events recorded:  Ir
Events shown:     Ir
Event sort order: Ir
Thresholds:       99
Include dirs:     
User annotated:   
Auto-annotation:  off

--------------------------------------------------------------------------------
       Ir 
--------------------------------------------------------------------------------
4,605,808  PROGRAM TOTALS

--------------------------------------------------------------------------------
       Ir  file:function
--------------------------------------------------------------------------------
  670,486  src/lcthw/bstrlib.c:bstrcmp [tests/bstree_tests]
  194,377  src/lcthw/bstree.c:BSTree_get [tests/bstree_tests]
   65,580  src/lcthw/bstree.c:default_compare [tests/bstree_tests]
   16,338  src/lcthw/bstree.c:BSTree_delete [tests/bstree_tests]
   13,000  src/lcthw/bstrlib.c:bformat [tests/bstree_tests]
   11,000  src/lcthw/bstrlib.c:bfromcstralloc [tests/bstree_tests]
    7,774  src/lcthw/bstree.c:BSTree_set [tests/bstree_tests]
    5,800  src/lcthw/bstrlib.c:bdestroy [tests/bstree_tests]
    2,323  src/lcthw/bstree.c:BSTreeNode_create [tests/bstree_tests]
    1,183  /private/tmp/pkg-build/coregrind//vg_preloaded.c:vg_cleanup_env [/usr/local/lib/valgrind/vgpreload_core-amd64-darwin.so]

$ 

