use strict;
use warnings;
use Test::More;

eval "use Set::Product::XS; 1" or do {
    plan skip_all => 'Set::Product::XS is not installed.';
};

local $ENV{SET_PRODUCT_PP} = 1;
require Set::Product;
ok \&Set::Product::product == \&Set::Product::PP::product,
    'environment variable forced PP';

# Force the module to be reloaded.
delete $INC{'Set/Product.pm'};

local @ENV{qw(SET_PRODUCT_PP PURE_PERL)} = (0) x 2;
require Set::Product;
ok \&Set::Product::product == \&Set::Product::XS::product, 'used XS';

done_testing;
