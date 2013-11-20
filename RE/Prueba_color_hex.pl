#!/usr/bin/perl 
# Ficheros en https://github.com/renatolrr/EjerciciosPerlAvanzado 

#use Regexp::Common 'RE_ALL';


$linea =" #FF0000 - Con este código HTML le decimos al navegador que muestre la máxima cantidad de rojo ";

if ( $linea =~ m/([A-Fa-f0-9])/) {
		print "Usando expresiones regurales.\n";
		print "La linea contiene un número hexadecimal: $1 \n";
}

if ($linea =~ /( $RE{num}{hex})/ ) {
		print "Usando Regexp::Common.\n";
		print "La linea contiene un número hexadecimal: $1 \n";
}

