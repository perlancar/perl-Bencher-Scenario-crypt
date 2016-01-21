package Bencher::Scenario::crypt;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark various algorithms of crypt()',
    on_failure => 'skip',
    participants => [
        {
            name => 'crypt',
            code_template => 'state $i = 0; my $c = crypt(++$i, <salt>); die "crypt fails/unsupported" unless $c; $c',
        }
    ],
    datasets => [
        {name=>'des', args=>{salt=>'aa'}},
        {name=>'md5-crypt', args=>{salt=>'$1$12345678$'}},

        {name=>'bcrypt-8', args=>{salt=>'$2b$8$1234567890123456789012$'}},
        {name=>'bcrypt-10', args=>{salt=>'$2b$10$1234567890123456789012$'}},
        {name=>'bcrypt-12', args=>{salt=>'$2b$12$1234567890123456789012$'}},
        {name=>'bcrypt-14', args=>{salt=>'$2b$14$1234567890123456789012$'}},

        {name=>'ssha256-5k', args=>{salt=>'$5$rounds=5000$1234567890123456$'}},
        {name=>'ssha256-50k', args=>{salt=>'$5$rounds=50000$1234567890123456$'}},
        {name=>'ssha256-500k', args=>{salt=>'$5$rounds=500000$1234567890123456$'}},

        {name=>'ssha512-5k', args=>{salt=>'$6$rounds=5000$1234567890123456$'}},
        {name=>'ssha512-50k', args=>{salt=>'$6$rounds=50000$1234567890123456$'}},
        {name=>'ssha512-500k', args=>{salt=>'$6$rounds=500000$1234567890123456$'}},
    ],
};

1;
# ABSTRACT:
