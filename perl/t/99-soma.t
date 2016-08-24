use Test::Simple tests => 1;

use lib 'lib';
use Acme::Idol;

my $idol = Acme::Idol->new({
    name => '치즈군',
    retire_message => '소마 떨어졌잖아! 나 개발자 그만둘래!'    
});

ok(1);
