#!/usr/bin/perl

use strict;
use warnings;

use lib qw(lib);

use PA::Persona;

my $persona = new PA::Persona ( '24', 'Pepito', 
				'Alfacar');
print $persona->to_string, "\n";
