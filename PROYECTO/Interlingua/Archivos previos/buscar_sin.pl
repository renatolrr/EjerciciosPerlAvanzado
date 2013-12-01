#!/usr/bin/perl 
# Ficheros en https://github.com/renatolrr/EjerciciosPerlAvanzado 

open(f1, 'DICTIONARIO DE SYNONYMOS 2013.txt');
my @datos=<f1>;
close(f1);

print "Palabra a buscar:\n";
my $p=<STDIN>;
chomp($p);


for($x=0; $x <=@datos; $x += 1){
	if (@datos[$x] =~ m/(·\s${p})\s/){
		@datos[$x] =~ s/(·\s)/\n/g;
		@datos[$x] =~ s/(\s\:\s)/\n/g;
		print @datos[$x];
	}
}
