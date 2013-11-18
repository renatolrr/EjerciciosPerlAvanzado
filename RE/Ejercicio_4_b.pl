#!/usr/bin/perl 
# Ficheros en https://github.com/renatolrr/EjerciciosPerlAvanzado 

open(f1, 'expreg.txt');
my @datos=<f1>;
close(f1);

my $count;
my $linea;

foreach $linea ( @datos ) { 
 print $linea;
 if ($linea =~ m/Este+/i){
	 $count+=1;
 }
}
print "El numero es: " . $count . "\n";

