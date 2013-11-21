#!/usr/bin/perl
# Ficheros en https://github.com/renatolrr/EjerciciosPerlAvanzado 

#Todavía no sabemos utilizar base de datos :-(


use strict;
use warnings;
use v5.10;

use lib qw(lib);

use PA::Moose::Alumno;
use Term::Menu;

my $alumno;

sub menu{
	 my $menu = new Term::Menu;
     my $answer = $menu->menu(
        entr =>["Entrada alumno", '1'],
        con  => ["Dato del alumno", '2'],
        tod  => ["Busca un alumno por su dni", '3'],
        sal => ["Para salir", '4'],
        
    );
    if(defined($answer)&&($answer ne 'sal')) {
        if($answer eq'entr') {
			alta();
			menu();
		}elsif ($answer eq'con'){
			listado();
			menu();
		}else {
			busca();
			menu();
		} 
  } else {
        print "Te vas, bye\n";
  }
	
}
 
  
 sub alta{ 
	print "Dni del Alumno\n";
	my $dni=<STDIN>;
	print "Nombre Alumno\n";
	my $nombre=<STDIN>;
	print "Email\n";
	my $email=<STDIN>;
	print "Curso\n";
	my $curso=<STDIN>;
	print "Couta mensual\n";
	my $mes=<STDIN>;

	$alumno = new PA::Moose::Alumno ( dni => $dni, 
				       nombre => $nombre,
				       email =>  $email,
				       curso => $curso, 
				       mes => int($mes));
	print "\n";
	
	#graba
	
	open (f1,">>Ejercicio_1_b.txt");
    print f1 "Dni: " . $dni;
  	print f1 "Nombre: " . $nombre;
  	print f1 "Email: " . $email;
  	print f1 "Curso: " . $curso;
  	print f1 "Mensualidad: " . $mes;
  	print "\n";
	close (f1);
	
	return $alumno;
}

sub listado{
	print $alumno->to_string, "\n";
	
}
sub busca{
	print "Dni del Alumno\n";
	my $dni=<STDIN>;
	open (f1,"Ejercicio_1_b.txt");
	my @datos = <f1>;
	my $x;
	for($x=0; $x <= @datos; $x += 1){
		# para quitar 
		# uso if (defined(@datos) && (@datos[$x] =~ m/Dni: $dni?/)){
		if (@datos[$x] =~ m/Dni: $dni?/){
			print @datos[$x+1,$x+2,$x+3,$x+4];
		}
	}
	close (f1);
	
}


menu();
			

