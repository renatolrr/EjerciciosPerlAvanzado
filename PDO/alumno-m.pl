#!/usr/bin/perl

use strict;
use warnings;
use v5.10;

use lib qw(lib);

use PA::Moose::Alumno;

my $alumno = new PA::Moose::Alumno ( dni => '25', 
				       nombre => 'Pepito', 
				       curso => 'Física', 
				       mes => 300);
say $alumno->to_string, "\n";
