

use 5.016000;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

our @EXPORT_OK = qw();

our $VERSION = '0.01';

require XSLoader;
XSLoader::load('Numeric', $VERSION);

package Array;

sub new {
	my ($class, @args) = @_;
	my $self = {
		data => alloc($args[0]),
		size => $args[0]
	};
	return bless $self, $class;
	
}

sub at {
	my $self = shift;
	my $index = shift;
	if (@_) {
		set($self->{data}, $index, shift);
	} else {
		get($self->{data}, $index);
	}
}

sub DESTROY {
	my $self = shift;
	dealloc($self->{data});
}

package Matrix;

sub new {
	my ($class, @args) = @_;
	my $self = {
		data => alloc($args[0],$args[1]),
		rows => $args[0],
		cols => $args[1]
	};
	return bless $self, $class;
}

sub at {
	my $self = shift;
	my $i = shift;
	my $j = shift;
	if (@_) {
		set($self->{data}, $i, $j, shift);
	} else {
		get($self->{data}, $i, $j);
	}
}

sub DESTROY {
	my $self = shift;
	dealloc($self->{data}, $self->{rows});
}



1;
__END__

=head1 NAME

Numeric - Perl extension for simple C data structures

=head1 SYNOPSIS

  use Numeric;
  
  #Create and fill in an array
  my $a = new Array(10);

  for (0..9) {
  	$a->at($_, $_ * $_);
  }

  for (0..9) {
  	print $a->at($_)."\n";
  }

  #Create and fill in a matrix
  $b = new Matrix(10,10);

  for my $i (0..9) {
  	for my $j (0..9) {
  		$b->at($i, $j, $i*$j);
  	}
  }

  for my $i (0..9) {
  	for my $j (0..9) {
  		print $b->at($i, $j)."\t";
  	}
  	print "\n";
  }

=head1 DESCRIPTION

Numeric is a simple extension to allow using C arrays and matrices in perl. Currently, we have two datatypes - array of doubles and array of array of doubles. Both structures are heap allocated. The module does the minimum possible amount of work to limit the overhead. While it is not as fast as C itself, it drastically reduces the amount of space a comparable perl datastructure would occupy.

=head2 EXPORT

Array->new($size)
Matrix->new($rows, $cols)


=head1 SEE ALSO

XS Tutorial - http://perldoc.perl.org/perlxstut.html

=head1 AUTHOR

Ivan Kryukov <lt>firstname dot o dot lastname at gmail dot com<gt>

=head1 COPYRIGHT AND LICENSE

Perl GPL - http://perldoc.perl.org/perlgpl.html


=cut
