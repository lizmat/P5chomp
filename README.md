[![Actions Status](https://github.com/lizmat/P5chomp/workflows/test/badge.svg)](https://github.com/lizmat/P5chomp/actions)

NAME
====

Raku port of Perl's chomp() / chop() built-ins

SYNOPSIS
========

    use P5chomp; # exports chomp() and chop()

    chomp $a;
    chomp @a;
    chomp %h;
    chomp($a,$b);
    chomp();   # bare chomp may be compilation error to prevent P5isms in Raku

    chop $a;
    chop @a;
    chop %h;
    chop($a,$b);
    chop();      # bare chop may be compilation error to prevent P5isms in Raku

DESCRIPTION
===========

This module tries to mimic the behaviour of the Perl's `chomp` and `chop` built-ins in Raku as closely as possible.

ORIGINAL PERL 5 DOCUMENTATION
=============================

    chop VARIABLE
    chop( LIST )
    chop    Chops off the last character of a string and returns the character
            chopped. It is much more efficient than "s/.$//s" because it
            neither scans nor copies the string. If VARIABLE is omitted, chops
            $_. If VARIABLE is a hash, it chops the hash's values, but not its
            keys, resetting the "each" iterator in the process.

            You can actually chop anything that's an lvalue, including an
            assignment.

            If you chop a list, each element is chopped. Only the value of the
            last "chop" is returned.

            Note that "chop" returns the last character. To return all but the
            last character, use "substr($string, 0, -1)".

    chomp VARIABLE
    chomp( LIST )
    chomp   This safer version of "chop" removes any trailing string that
            corresponds to the current value of $/ (also known as
            $INPUT_RECORD_SEPARATOR in the "English" module). It returns the
            total number of characters removed from all its arguments. It's
            often used to remove the newline from the end of an input record
            when you're worried that the final record may be missing its
            newline. When in paragraph mode ("$/ = """), it removes all
            trailing newlines from the string. When in slurp mode ("$/ =
            undef") or fixed-length record mode ($/ is a reference to an
            integer or the like; see perlvar) chomp() won't remove anything.
            If VARIABLE is omitted, it chomps $_. Example:

                while (<>) {
                    chomp;  # avoid \n on last field
                    @array = split(/:/);
                    # ...
                }

            If VARIABLE is a hash, it chomps the hash's values, but not its
            keys, resetting the "each" iterator in the process.

            You can actually chomp anything that's an lvalue, including an
            assignment:

                chomp($cwd = `pwd`);
                chomp($answer = <STDIN>);

            If you chomp a list, each element is chomped, and the total number
            of characters removed is returned.

            Note that parentheses are necessary when you're chomping anything
            that is not a simple variable. This is because "chomp $cwd =
            `pwd`;" is interpreted as "(chomp $cwd) = `pwd`;", rather than as
            "chomp( $cwd = `pwd` )" which you might expect. Similarly, "chomp
            $a, $b" is interpreted as "chomp($a), $b" rather than as
            "chomp($a, $b)".

PORTING CAVEATS
===============

In future language versions of Raku, it will become impossible to access the `$_` variable of the caller's scope, because it will not have been marked as a dynamic variable. So please consider changing:

    chomp;

to either:

    chomp($_);

or, using the subroutine as a method syntax, with the prefix `.` shortcut to use that scope's `$_` as the invocant:

    .&chomp;

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

If you like this module, or what I’m doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

Source can be located at: https://github.com/lizmat/P5chomp . Comments and Pull Requests are welcome.

COPYRIGHT AND LICENSE
=====================

Copyright 2018, 2019, 2020, 2021, 2023 Elizabeth Mattijsen

Re-imagined from Perl as part of the CPAN Butterfly Plan.

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

