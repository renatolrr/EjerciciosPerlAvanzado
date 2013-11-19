#!/usr/bin/perl 
# Ficheros en https://github.com/renatolrr/EjerciciosPerlAvanzado 

use Regexp::Common 'RE_ALL';

open(f1, 'color.txt');
my @datos=<f1>;
close(f1);

my $linea;

foreach $linea ( @datos ) { 
	if ($linea =~ /($RE{num}{real})/ ) {
		print "La linea contiene un número real: $1 \n";
    }
}

foreach $linea ( @datos ) { 
	if ($linea =~ /( $RE{num}{hex}{-group => 6})/ ) {
		print "La linea contiene un número hexadecimal: $1 \n";
    }
}
