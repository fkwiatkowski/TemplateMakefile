#include <stdio.h>

#include <mydebug.h>

#include "tools.h"

void dummyprintf(void) {
	PRINTF("%s : %s\n",__FILE__,__FUNCTION__);
};
