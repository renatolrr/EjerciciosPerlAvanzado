#!/usr/bin/perl
# Los ejercicios están en https://github.com/renatolrr/EjerciciosPerlAvanzado

use v5.10;

use lib qw(lib);

use PA::Moose::Palabra;

my $palabra = new PA::Moose::Palabra ( palabra => 'arena');
say $palabra->to_string, "\n";
say "\n Diccionario:\n";
$palabra->diccionario;
say "\n Sinonimo:\n";
$palabra->sinonimo;
say "\n Tesauro:\n";
$palabra->tesauro;

