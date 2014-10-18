# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl Numeric.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More tests => 6;
BEGIN { use_ok('Numeric') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my $a;
ok($a = new Array(10));

for (0..9) {
	$a->at($_, $_*$_);
}
# for (0..9) {
# 	diag($a->at($_)."\n");
# }

is($a->at(9),81,'squares');

my $b;
ok($b = new Matrix(10,10));

for my $i (0..9) {
	for my $j (0..9) {
		$b->at($i, $j, $i*$j);
	}
}

# for my $i (0..9) {
# 	for my $j (0..9) {
# 		diag $b->at($i, $j)."\t";
# 	}
# 	diag "\n";
# }

is($b->at(9,9),81,'squares');
is($b->at(7,4),28,'squares');