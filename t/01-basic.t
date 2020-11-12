use v6.*;
use Test;
use P5chomp;

plan 4;

ok defined(::('&chomp')),         'is &chomp imported?';
ok !defined(P5chomp::{'&chomp'}), 'is &chomp externally NOT accessible?';
ok defined(::('&chop')),          'is &chop imported?';
ok !defined(P5chomp::{'&chop'}),  'is &chop externally NOT accessible?';

# vim: expandtab shiftwidth=4
