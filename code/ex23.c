#include <stdio.h>
#include <string.h>
#include "dbg.h"
#define FROM 1
#define TO 0
#define DEG


void print(char *str, int style)
{
#ifdef DEG
	switch(style)
	{
		case FROM:
			printf("\nThis is 'from' begin \n");
			printf(str);
			printf("\nThis is  'from' end\n");
			break;
		case TO:
			printf("\nThis is 'to' begin\n");
			printf(str);
			printf("\nThis is 'to' end \n");
			break;
	}
#endif
	
}

int normal_copy(char *from, char *to, int count)
{
    int i = 0;

    for(i = 0; i <= count; i++) {
        to[i] = from[i];
    }

    return i;
}

int duffs_device(char *from, char *to, int count)
{
    {
        int n = (count + 7) / 8;

        switch(count % 8) {
            case 0: do { *to++ = *from++;
                        case 7: *to++ = *from++;
                        case 6: *to++ = *from++;
                        case 5: *to++ = *from++;
                        case 4: *to++ = *from++;
                        case 3: *to++ = *from++;
                        case 2: *to++ = *from++;
                        case 1: *to++ = *from++;
                    } while(--n > 0);
        }
    }

    return count;
}

int zeds_device(char *from, char *to, int count)
{
    {
        int n = (count + 7) / 8;

        switch(count % 8) {
            case 0: 
            again: *to++ = *from++;

            case 7: *to++ = *from++;
            case 6: *to++ = *from++;
            case 5: *to++ = *from++;
            case 4: *to++ = *from++;
            case 3: *to++ = *from++;
            case 2: *to++ = *from++;
            case 1: *to++ = *from++;
                    if(--n > 0) goto again;
        }
    }

    return count;
}

int valid_copy(char *data, int count, char expects)
{
    int i = 0;
    for(i = 0; i < count; i++) {
        if(data[i] != expects) {
            log_err("[%d] %c != %c", i, data[i], expects);
            return 0;
        }
    }

    return 1;
}


int main(int argc, char *argv[])
{
    char from[1000] = {'a'};
    char to[1000] = {'c'};
    int rc = 0;

    // setup the from to have some stuff
    memset(from, 'x',1000);
    // set it to a failure mode
    memset(to, 'y', 1000);
	print(from,FROM);
	print(to,TO);
    //check(valid_copy(to, 1000, 'y'), "Not initialized right.");

    // use normal copy to 
    rc = normal_copy(from, to, 1000);
	printf("rc=%d \n",rc);
    check(rc == 1000, "Normal copy failed: %d", rc);
    check(valid_copy(to, 1000, 'x'), "Normal copy failed.");
//	print(from,FROM);
//	print(to,TO);

    // reset
    memset(to, 'y', 1000);

    // duffs version
    rc = duffs_device(from, to, 1000);
    check(rc == 1000, "Duff's device failed: %d", rc);
    check(valid_copy(to, 1000, 'x'), "Duff's device failed copy.");
//	print(from,FROM);
	//print(to,TO);

    // reset
    memset(to, 'y', 1000);

    // my version
    rc = zeds_device(from, to, 1000);
    check(rc == 1000, "Zed's device failed: %d", rc);
    check(valid_copy(to, 1000, 'x'), "Zed's device failed copy.");
	//print(from,FROM);
	//print(to,TO);

    return 0;
error:
    return 1;
}
