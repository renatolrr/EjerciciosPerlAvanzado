#!/usr/bin/perl 
# Ficheros en https://github.com/renatolrr/EjerciciosPerlAvanzado 

open(f1, 'THESAURO_2013.txt');
my @datos=<f1>;
close(f1);

print "Palabra a buscar:\n";
my $p=<STDIN>;
chomp($p);


for($x=0; $x <=@datos; $x += 1){
	if (@datos[$x] =~ m/(·\s${p})\s/){
		print  split("· ",@datos[$x]);
	}
}
