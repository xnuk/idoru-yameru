#!/usr/bin/env perl
use 5.008001;
use utf8;
use strict;
use warnings;

use lib 'lib';
use Acme::Idol;

BEGIN {
    binmode STDOUT, ":encoding(utf8)";
    binmode STDERR, ":encoding(utf8)";
}

my $idol = Acme::Idol->new({
    name => '미오',
    retire_message => '손님 엄청 적잖아! 나 아이돌 그만둘래!'
});


printf("안녕하세요! 신인 아이돌 %s입니다!\n", $idol->name);
