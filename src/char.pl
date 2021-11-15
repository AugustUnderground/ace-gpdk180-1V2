#!/usr/bin/perl

use strict;
use warnings;
use experimental 'switch';

use Getopt::Long qw(GetOptions);
use Scalar::Util qw(looks_like_number);

my $usage = "Usage:\t$0 [--nmos | --pmos]\n";

my $nmos;   # NMOS Device
my $pmos;   # PMOS Device

$|++;

# Just Loggin
sub Log {
    my ($code, $mos) = @_;
    
    if ($code == 0) {
        print "[\e[1;32m ✔ \e[0m] $mos characterized.\n";
    } else {
        print "[\e[1;31m ✘ \e[0m] $mos characterization returned $code.\n";
    }
}

# Characterize a primitive device 
# Char(node, device) => exit_code
sub Char {
    my $mos   = $_[0];
    my $log   = "./chr/$mos.log";
    my $raw   = "./chr/$mos.raw";
    my $scs   = "./chr/$mos.scs";
    system "spectre =l $log -format nutbin -raw $raw -I./pdk $scs";
    return $?;
}

# Get command line arguments
GetOptions( 'nmos|n'   => \$nmos
          , 'pmos|p'   => \$pmos
          ) or die $usage;

# If no device type is given, enable both.
unless($nmos || $pmos) { ($nmos, $pmos) = (1,1); }

my ($n, $p) = ("nmos", "pmos");
    
if($nmos) {
    my $nc = Char($n);
    Log($nc, $n);
}

if($pmos) {
    my $np = Char($p);
    Log($np, $p);
}

exit 0;
