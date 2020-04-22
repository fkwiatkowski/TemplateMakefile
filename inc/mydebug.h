/*!
* \file  mydebug.h
* \brief
* \author KWIATKOWSKI Frederic
* \date 22/04/2020
*/

#ifndef _DEBUG_H_
#define _DEBUG_H_
#include <stdio.h>

#define PRINTF(fmt, ...)              \
	(void)printf("[Template Makefile] : ");   \
	(void)printf(fmt, ##__VA_ARGS__); \
	(void)printf("\n");               \
	fflush(stdout);

#endif //_DEBUG_H_
