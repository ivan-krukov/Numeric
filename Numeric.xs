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
	unsigned int n;
	CODE:
		RETVAL = (double *)(malloc(n*sizeof(double)));
	OUTPUT:
		RETVAL

void
set(A,i,v)
	double *A;
	unsigned int i;
	double v;
	CODE:
		A[i]=v;

double
get(A,i)
	double *A;
	unsigned int i;
	CODE:
		RETVAL = A[i];
	OUTPUT:
		RETVAL


void
dealloc(A)
	double *A;
	CODE:
		free(A);

MODULE = Numeric		PACKAGE = Matrix		

PROTOTYPES: DISABLE

TYPEMAP: <<END
double **	T_PTRREF
END

double **
alloc(r,c)
	unsigned int r;
	unsigned int c;
	CODE:
		double **M = (double **)(malloc(r*sizeof(double *)));
		int i;
		for (i = 0; i < c; i++) {
			M[i] = (double *)(malloc(c*sizeof(double)));
		}
		RETVAL = M;
	OUTPUT:
		RETVAL

void
set(M,i, j,v)
	double **M;
	unsigned int i;
	unsigned int j;
	double v;
	CODE:
		M[i][j]=v;

double
get(M,i,j)
	double **M;
	unsigned int i;
	unsigned int j;
	CODE:
		RETVAL = M[i][j];
	OUTPUT:
		RETVAL

void
dealloc(M,r)
	double **M;
	unsigned int r;
	CODE:
		int i;
		for(i = 0; i < r; i++) {
			free(M[i]);
		}
		free(M);