

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
		data => alloc($args[0])
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

# Preloaded methods go here.



1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Numeric - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Numeric;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Numeric, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

A. U. Thor, E<lt>ivan@nonetE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2014 by A. U. Thor

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.20.1 or,
at your option, any later version of Perl 5 you may have available.


=cut
