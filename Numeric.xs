#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"


MODULE = Numeric		PACKAGE = Array		

PROTOTYPES: DISABLE

TYPEMAP: <<END
double *	T_PTRREF
END

double *
alloc(n)
	int n;
	CODE:
		RETVAL = (double *)(malloc(n*sizeof(double *)));
	OUTPUT:
		RETVAL

void
set(A,i,v)
	double *A;
	int i;
	double v;
	CODE:
		A[i]=v;

double
get(A,i)
	double *A;
	int i;
	CODE:
		RETVAL = A[i];
	OUTPUT:
		RETVAL


void
dealloc(A)
	double *A;
	CODE:
		free(A);