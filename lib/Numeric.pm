use 5.016000;
use strict;
use warnings;
use feature 'signatures';

require Exporter;

our @ISA = qw(Exporter);

our $VERSION = '0.01';
our %EXPORT_TAGS = ( 'all' => [ qw() ] );
our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );
our @EXPORT = qw();

require XSLoader;
XSLoader::load( 'Numeric', $VERSION );

1;
__END__

=head1 NAME

Numeric - Perl extension for simple C matrices

=head1 SYNOPSIS

my $N = 64**2;
my $A = Matrix::new( $N, $N );

for my $i ( 0 .. $N - 1 ) {
    for my $j ( 0 .. $N - 1 ) {
        Matrix::set( $A, $i, $j, rand(1) );
    }
}

for my $i ( 0 .. $N - 1 ) {
    my $r = Matrix::get_row( $A, $i );
    # printf "%f\t", Array::get( $r, $i );
}

Matrix::delete( $A, 10 );


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
