#!/usr/bin/perl

use strict;
use warnings;
use v5.10;

use lib qw(lib);

use PA::Alumno;

my $alumno = new PA::Alumno ( '24', 'Pepito', 
				'Alfacar','Matemáticas','30');
			
print $alumno->to_string, "\n";
