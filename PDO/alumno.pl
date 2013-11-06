#!/usr/bin/perl

use strict;
use warnings;
use v5.10;

use lib qw(lib);

use PA::Alumno;

my $simple = new PA::Alumno;
say "Alumno: ".$simple->datos;
