$ tests/hashmap_algos_tests
# copy-paste the table it prints out
$ vim hash.txt
$ R
> hash <- read.table("hash.txt", header=T)
> summary(hash)
      FNV            A32              DJB      
 Min.   : 945   Min.   : 908.0   Min.   : 927  
 1st Qu.: 980   1st Qu.: 980.8   1st Qu.: 979  
 Median : 998   Median :1000.0   Median : 998  
 Mean   :1000   Mean   :1000.0   Mean   :1000  
 3rd Qu.:1016   3rd Qu.:1019.2   3rd Qu.:1021  
 Max.   :1072   Max.   :1075.0   Max.   :1082  
>
