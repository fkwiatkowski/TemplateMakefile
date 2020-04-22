#include <stdio.h>

#include <mydebug.h>

#include "tools/tools.h"


int main(int argc, char *argv[]) {
    (void)argc;
    (void)argv;
    PRINTF("%s : Hello World\n",__FILE__);
    dummyprintf();
    return 0;
}