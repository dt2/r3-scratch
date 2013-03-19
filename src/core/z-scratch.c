
// @dt2's scratch, core .c file

#include "sys-core.h"
//#include "tmp-comptypes.h"
#include "sys-deci-funcs.h"

#include <math.h>
#include <float.h>

/***********************************************************************
**
*/	REBNATIVE(mini_scratch)
/*
***********************************************************************/
{
	REBVAL a, b;

	if (IS_PAIR(D_ARG(1)) || IS_PAIR(D_ARG(2)))
		return Min_Max_Pair(ds, 0);

	a = *D_ARG(1);
	b = *D_ARG(2);
	if (Compare_Values(&a, &b, -1)) return R_ARG2;
	return R_ARG1;
}

