#!/usr/bin/perl
# Los ejercicios están en https://github.com/renatolrr/EjerciciosPerlAvanzado

use strict;
use warnings;

use v5.10;

use lib qw(lib);

use PA::Moose::Personaje;

my @tips = ("necrolito", "humano", "demonio");
my $rand=int(rand(3));
my $tipo = $tips[$rand];

my $personaje = new PA::Moose::Personaje ( 	nick => 'malo', 
											tipo => $tipo);
say $personaje->to_string, "\n";
$personaje->crea_personaje;



