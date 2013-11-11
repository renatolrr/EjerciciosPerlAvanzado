#!/usr/bin/perl


use strict;
use warnings;
use v5.10;

use lib qw(lib);

use PA::Alumno;

my $alumno;

use Term::Menu;
  my $menu = new Term::Menu;
  my $answer = $menu->menu(
        uno    => ["Entrada alumno", '1'],
        dos    => ["Dato del alumno", '2'],
        
  );
   if(defined($answer)) {
        if($answer='uno') {
			alta();
		} else {
			print "listado";
			listado();
		} 
  } else {
        print "Answer was undefined\n";
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

	my $alumno = new PA::Alumno ( $dni, $nombre, 
				$email,$curso,$mes);
	print "\n";
	return $alumno;
}

sub listado{
	print $alumno->to_string, "\n";
	
}
			

