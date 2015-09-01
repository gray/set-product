package Set::Product;

use strict;
use warnings;

use Carp qw(croak);
use Exporter qw(import);
use Set::Product::PP;

our $VERSION = '0.01';
$VERSION = eval $VERSION;

our @EXPORT_OK = qw(product);

my $want_xs = ! $ENV{SET_PRODUCT_PP} and ! $ENV{PURE_PERL}
    and eval "use Set::Product::XS; 1";

no warnings qw(redefine);

*product = $want_xs
    ? \&Set::Product::XS::product
    : \&Set::Product::PP::product;


1;

__END__

=head1 NAME

Set::Product - generates the cartesian product of a set of lists

=head1 SYNOPSIS

    use Set::Product qw(product);

    product { say "@_" } [1..10], ['A'..'E'], ['u'..'z'];

=head1 DESCRIPTION

The C<Set::Product> module generates the cartesian product of a set of lists.

=head1 FUNCTIONS

=head2 product

    product { BLOCK } \@array1, \@array2, ...

Evaluates C<BLOCK> and sets @_ to each tuple in the cartesian product for the
list of array references.

=head1 NOTES

If C<Set::Product::XS> is installed, this module will automatically use it.
You can prevent that and stick with the pure Perl version by setting the
C<SET_PRODUCT_PP> or C<PURE_PERL> environment varible before using this module.

=head1 PERFORMANCE

This distribution contains a benchmarking script which compares several
modules available on CPAN. These are the results on a MacBook 2.6GHz Core i5
(64-bit) with Perl 5.22.0:

    Set::Crossproduct          45.61+-0.3/s
    List::Gen                 60.75+-0.51/s
    Algorithm::Loops          68.32+-0.56/s
    Set::Scalar                100.8+-1.4/s
    Math::Cartesian::Product   203.2+-3.4/s
    Set::Product::PP           275.4+-1.3/s
    Set::Product::XS         724.96+-0.43/s

=head1 SEE ALSO

L<https://en.wikipedia.org/wiki/Cartesian_product>

L<Set::Product::XS>

L<Algorithm::Loops>

L<List::Gen>

L<Math::Cartesian::Product>

L<Set::CrossProduct>

L<Set::Product>

L<Set::Scalar>

=head1 REQUESTS AND BUGS

Please report any bugs or feature requests to
L<http://rt.cpan.org/Public/Bug/Report.html?Queue=Set-Product>. I will be
notified, and then you'll automatically be notified of progress on your bug as
I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Set::Product

You can also look for information at:

=over

=item * GitHub Source Repository

L<https://github.com/gray/set-product>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Set-Product>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Set-Product>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/Public/Dist/Display.html?Name=Set-Product>

=item * Search CPAN

L<http://search.cpan.org/dist/Set-Product/>

=back

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2015 gray <gray at cpan.org>, all rights reserved.

This library is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.

=head1 AUTHOR

gray, <gray at cpan.org>

=cut
