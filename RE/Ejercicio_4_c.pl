#!/usr/bin/perl 
# Ficheros en https://github.com/renatolrr/EjerciciosPerlAvanzado 

open(f1, 'pirata.txt');
my @datos=<f1>;
close(f1);

for($x=0; $x <=@datos; $x += 1){
	if (@datos[$x] =~ m/la+/){
		print"++++++++++++++++++++\n";
		print @datos[$x-2,$x-1];
		print @datos[$x+1,$x+2];
		
	}
}


