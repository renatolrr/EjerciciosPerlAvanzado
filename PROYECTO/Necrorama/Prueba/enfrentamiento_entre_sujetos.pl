#!/usr/bin/perl
# Los ejercicios están en https://github.com/renatolrr/EjerciciosPerlAvanzado

use strict;
use warnings;

use v5.10;


#Hay que tener en cuenta la reserva, los modificadores, trabajo en equipo y equipo.
my $rasgo_jug_1="atletismo 3";
my $rasgo_jug_2="escape 5";

my $dado;
my $diferencia;
my $resultado;


tirar_dado();
my $dado_jug_1=$dado;
tirar_dado();
my $dado_jug_2=$dado;


my $rasgo_1=chop($rasgo_jug_1);
my $rasgo_2=chop($rasgo_jug_2);
$diferencia=$dado_jug_1+$rasgo_jug_1-$dado_jug_2+$rasgo_jug_2;

if ($diferencia==0){
	$resultado="Empate";
}elsif($diferencia>=1){
	$resultado="Gana Jugador 1";
}else{
	$resultado="Gana Jugador 2";
}
 print $resultado."\n";

sub tirar_dado{ 
	my $dado_1=int(rand(10))+1;
	my $dado_2=int(rand(10))+1;


	if ($dado_1>$dado_2){
		$dado=$dado_1;	
	}else{
		$dado=$dado_2;
	}

}

