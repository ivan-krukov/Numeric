# Numeric - Perl extension for simple C matrices

Numeric is a simple extension to allow using `C` arrays in `perl`. 
Currently, we have two datatypes - array of doubles and array of array of doubles. 
Both structures are heap allocated. 
The module does the minimum possible amount of work to limit the overhead. 
We have a minimal functional interface to avoid dynamic name lookups.
This provides a large reduction in the space required for the data structure. The speed gain is also considerable.

# Synopsis

``` perl
	my $N = 64**2;
	my $A = Matrix::new( $N, $N );

	for my $i ( 0 .. $N - 1 ) {
	    for my $j ( 0 .. $N - 1 ) {
	        Matrix::set( $A, $i, $j, rand(1) );
	    }
	}

	for my $i ( 0 .. $N - 1 ) {
	    my $R = Matrix::get_row( $A, $i );
	   	my $d = Array::get($R, $i);
	    for my $j ( 0 .. $N - 1 ) {
	        Matrix::get( $A, $i, $j );
	    }
	}

	Matrix::delete( $A, $N );
```

# Installation

With root priveledges you can do this for system-wide install:
``` bash
	perl Makefile.PL
	make
	make test
	sudo make install
```
For a local install:
``` bash
   perl Makefile.PL PREFIX=~/perl5
   make
   make test
   make install
   export PERL5LIB=~/perl5 #add this to ~/.bashrc or ~/.zhsrc for persistency
```
# Licence

[Perl GPL](http://perldoc.perl.org/perlgpl.html)

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.20.1 or,
at your option, any later version of Perl 5 you may have available.