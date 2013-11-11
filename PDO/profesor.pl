#!/usr/bin/perl

use strict;
use warnings;
use v5.10;

use lib qw(lib);

use PA::Profesor;

my $profesor = new PA::Profesor ( '24', 'Pablo', 
				'Zaidin','10','3000');
print $profesor->to_string, "\n";
