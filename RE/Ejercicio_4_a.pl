#!/usr/bin/perl


$_ = 'AB AB AC';

open (f1,">Ejercicio_4_a.txt");
    
    
	print f1 m/c$/i;

	print f1 "\n";
	print f1 ' $ Modificador que indica que debe coincidir al final de la cadena.' . "\n";
	print f1 " i Busca coincidencias de patrones sin distinguir mayúsculas de minúsculas.\n";
	print f1 " Tenemos una C al final de la cadena y nos devuelve 1. \n";
	print f1 " Ficheros en https://github.com/renatolrr/EjerciciosPerlAvanzado \n";
close (f1);
