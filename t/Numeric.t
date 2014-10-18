# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl Numeric.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More tests => 4;
BEGIN { use_ok('Numeric') }

#########################

my $N = 100;
my $A;

ok( $A = Matrix::new( $N, $N ) );

for my $i ( 0 .. $N - 1 ) {
    for my $j ( 0 .. $N - 1 ) {
        Matrix::set( $A, $i, $j, $i * $j );
    }
}

for my $i ( 0 .. $N - 1 ) {
    my $R = Matrix::get_row( $A, $i );
    my $d = Array::get( $R, $i );

    for my $j ( 0 .. $N - 1 ) {
        Matrix::get( $A, $i, $j );
    }
}

is( Matrix::get( $A, 99, 99 ), 9801, 'squares' );
is( Matrix::get( $A, 34, 78 ), 2652, 'squares' );

Matrix::delete( $A, $N );

