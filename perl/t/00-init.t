use Test::Simple tests => 1;

use lib 'lib';
use Acme::Idol;

my $idol = Acme::Idol->new();
ok($idol->name eq "mio");

