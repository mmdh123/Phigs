/* fort/09/01/09/01/p04.f -- translated by f2c (version of 22 July 1992  22:54:52).
   You must link the resulting object file with the libraries:
	-lF77 -lI77 -lm -lc   (in that order)
*/

#include "f2c.h"

/* Table of constant values */

static integer c__1 = 1;

/*  ********************************************************* */
/*  *                                                       * */
/*  *    TEST NUMBER: 09.01.09.01/04                        * */
/*  *    TEST TITLE : Error 405 handled by user             * */
/*  *                                                       * */
/*  *    PHIGS Validation Tests, produced by NIST           * */
/*  *                                                       * */
/*  ********************************************************* */
#ifndef NO_PROTO
/* Main program */ MAIN__(void)
#else /* NO_PROTO */
/* Main program */ MAIN__()
#endif /* NO_PROTO */
{
#ifndef NO_PROTO
    extern /* Subroutine */ int e09405_(integer *), endit_(void), initgl_(
	    char *, ftnlen);
#else /* NO_PROTO */
    extern /* Subroutine */ int e09405_(), endit_(), initgl_();
#endif /* NO_PROTO */

    initgl_("09.01.09.01/04", 14L);
    e09405_(&c__1);
    endit_();
#ifndef NO_PROTO
    return 0;
#endif /* not NO_PROTO */
} /* MAIN__ */

