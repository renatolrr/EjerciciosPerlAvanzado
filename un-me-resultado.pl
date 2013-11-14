#!/usr/bin/perl

use strict;
use warnings;
use v5.10;

use lib qw(lib);

use PA::Moose::Partido;

my $partido = new PA::Moose::Partido ( local => 'Mondoñedo', 
				       visitante => 'Alcafrán', 
				       res_local => 4, 
				       res_visitante => 8 );
say "Resultado ", join("-",$partido->resultado );
say $partido->to_string, "\n";
