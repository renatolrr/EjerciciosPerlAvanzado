#!/usr/bin/perl

use strict;
use warnings;

use lib qw(lib);

use PA::Persona;

my $partido = new PA::Persona ( '24', 'Pepito', 
				'Alfacar', 'Matemáticas','30');
print $partido->to_string, "\n";
