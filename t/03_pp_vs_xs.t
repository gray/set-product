use strict;
use warnings;
use Test::More;

subtest 'use Set::Product::PP::product by default if Set::Product::XS is not installed' => sub {
   eval "use Set::Product::XS; 1"
      ? ( plan skip_all => 'Set::Product::XS is installed' )
      : ( plan tests => 1 );

    require Set::Product;
    ok(\&Set::Product::product == \&Set::Product::PP::product, 
       'when Set::Product::XS is not installed product defaults to Set::Product::PP::product'
    );
};

done_testing;
