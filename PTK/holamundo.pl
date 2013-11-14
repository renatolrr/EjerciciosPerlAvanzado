#!/usr/bin/perl
use strict;
use warnings;
use Tk;

my $ventana = MainWindow->new();
$ventana->title('Ejemplo de Hola Mundo');
$ventana->geometry("300x200"); # damos el tamaño en anchura y altura
$ventana->resizable( 0, 0 ); #  no dejaremos que la redimensionen

# $ventana->minsize(qw(200 100));

$ventana->Label(-text => " Hola Mundo ")->pack();

MainLoop();
