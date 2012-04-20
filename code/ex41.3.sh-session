$ valgrind --tool=cachegrind tests/bstree_tests
...
$ cg_annotate --show=Dr,Dw cachegrind.out.1316 | grep -v "???"
--------------------------------------------------------------------------------
I1 cache:         32768 B, 64 B, 8-way associative
D1 cache:         32768 B, 64 B, 8-way associative
LL cache:         4194304 B, 64 B, 16-way associative
Command:          tests/bstree_tests
Data file:        cachegrind.out.1316
Events recorded:  Ir I1mr ILmr Dr D1mr DLmr Dw D1mw DLmw
Events shown:     Dr Dw
Event sort order: Ir I1mr ILmr Dr D1mr DLmr Dw D1mw DLmw
Thresholds:       0.1 100 100 100 100 100 100 100 100
Include dirs:     
User annotated:   
Auto-annotation:  off

--------------------------------------------------------------------------------
     Dr      Dw 
--------------------------------------------------------------------------------
997,124 349,058  PROGRAM TOTALS

--------------------------------------------------------------------------------
     Dr     Dw  file:function
--------------------------------------------------------------------------------
169,754 19,430  src/lcthw/bstrlib.c:bstrcmp
 67,548 27,428  src/lcthw/bstree.c:BSTree_get
 19,430 19,430  src/lcthw/bstree.c:default_compare
  5,420  2,383  src/lcthw/bstree.c:BSTree_delete
  2,000  4,200  src/lcthw/bstrlib.c:bformat
  1,600  2,800  src/lcthw/bstrlib.c:bfromcstralloc
  2,770  1,410  src/lcthw/bstree.c:BSTree_set
  1,200  1,200  src/lcthw/bstrlib.c:bdestroy

$ 
