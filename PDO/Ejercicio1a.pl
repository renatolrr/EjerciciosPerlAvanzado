#!/usr/bin/perl


use strict;
use warnings;
use v5.10;

use lib qw(lib);

use PA::Alumno;
use Term::Menu;

my $alumno;

sub menu{
	 my $menu = new Term::Menu;
     my $answer = $menu->menu(
        entr =>["Entrada alumno", '1'],
        lis  => ["Dato del alumno", '2'],
        sal => ["Para salir",3],
        
    );
    if(defined($answer)&&($answer ne 'sal')) {
        if($answer eq'entr') {
			alta();
			menu();
		} else {
			listado();
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

	$alumno = new PA::Alumno ( $dni, $nombre, 
				$email,$curso,$mes);
	print "\n";
	return $alumno;
}

sub listado{
	print $alumno->to_string, "\n";
	
}

menu();
			

