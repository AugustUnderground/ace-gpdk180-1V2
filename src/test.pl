#!/usr/bin/perl

use strict;
use warnings;

my @ops;
foreach (1..6) { @ops = (@ops, "op$_"); }

my @ckts = (@ops, "nand4", "st1");

foreach (@ckts) {
    my $log = "./src/test/$_.log";
    my $raw = "./src/test/$_.raw";
    my $scs = "./$_/input.scs";

    system "spectre =l $log -format nutascii -raw $raw -I./pdk $scs";

    if ($? == 0) {
        print "[\e[1;32m ✔ \e[0m] No errors for $_.\n";
    } else {
        print "[\e[1;31m ✘ \e[0m] $_ returned with $?.\n";
    }
}
