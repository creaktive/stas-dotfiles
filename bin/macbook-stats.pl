#!/usr/bin/perl
use strict;
use warnings;

my %memory;
if (-x q{/usr/bin/vm_stat}) {
    %memory = map {
        /\bPages\s+(free|active|inactive|wired\s+down):\s*(\d+)/ix
            ? (substr($1, 0, 1) => $2 << 2)
            : ();
    } qx{vm_stat};
} elsif (open my $meminfo, q{<}, q{/proc/meminfo}) {
    %memory = map {
        /\b(?:Mem)?(Free|Cached|Active|Inactive):\s*(\d+)/ix
            ? (substr($1, 0, 1) => $2)
            : ();
    } <$meminfo>;
    close $meminfo;
}

%memory && print
    map {
        sprintf q( %s:%0.2fG),
            lc,
            $memory{$_} / (2 ** 20)
    } sort keys %memory;

my @load;
if (open my $loadavg, q{<}, q{/proc/loadavg}) {
    @load = (split /\s+/x, <$loadavg>)[0 .. 2];
    close $loadavg;
} elsif (-x q{/usr/bin/uptime}) {
    @load = (split /\s+/x, qx{uptime})[-3 .. -1];
}

@load && print q{ l:}, join q{/}, @load;

if (-x q{/usr/sbin/ioreg}) {
    my @battery = map {
        /"(?:(?:Max|Current)Capacity|ExternalConnected)"\s*=\s*(\d+|Yes|No)/ix
            ? $1
            : ()
    } qx{ioreg -n AppleSmartBattery -r};
    printf q{ b:%s%.01f%%},
        $battery[2] =~ /^y/ix ? q{} : q{!},
        100 * $battery[1] / $battery[0];
}

printf qq{ %02d:%02d\n}, (localtime)[2, 1];
