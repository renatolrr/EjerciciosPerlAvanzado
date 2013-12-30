#!/usr/bin/perl
# Los ejercicios están en https://github.com/renatolrr/EjerciciosPerlAvanzado

use strict;
use warnings;

use v5.10;


#Hay que tener en cuenta la reserva, los modificadores, trabajo en equipo y equipo.
my $rasgo_jug_1="atletismo 3";
#Tabla de resistencia
#Chupada		3
#Muy fácil		5
#Fácil			7
#Normal			9
#Compleja		11
#Muy compleja	15
#Complicadisima	19
#Imposible		24
my $resistencia=5;
my $dado;
my $diferencia;
my $resultado;

my $dado_1=int(rand(10))+1;
my $dado_2=int(rand(10))+1;

if ($dado_1>$dado_2){
	$dado=$dado_1;	
}else{
	$dado=$dado_2;
}
my $rasgo=chop($rasgo_jug_1);
$diferencia=$dado+$rasgo-$resistencia;

if ($diferencia==0){
	$resultado="Empate";
}elsif($diferencia>=1 && $diferencia<=5){
	$resultado="Lo supera por poco";
}elsif($diferencia>=6 && $diferencia<=10){
	$resultado="Victoria holgada";
}elsif($diferencia>=11 && $diferencia<=15){
	$resultado="Lección magistral";
}elsif($diferencia>=16 ){
	$resultado="Perfección total";
}	
 print $resultado."\n";


