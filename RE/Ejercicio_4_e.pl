#!/usr/bin/perl 
# Ficheros en https://github.com/renatolrr/EjerciciosPerlAvanzado 

use Regexp::Common 'RE_ALL';

open(f1, 'color.txt');
my @datos=<f1>;
close(f1);



if (@datos=~ /($RE{num}{real})/ ) {
	print "El texto contiene números reales. \n";
}


if (@datos =~ /$RE{num}{hex}/ ) {
	print "El texto contiene números hexadecimales.\n";
    
}
