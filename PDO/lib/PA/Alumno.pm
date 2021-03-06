package PA::Alumno;

use strict;
use warnings;

use Carp qw(croak);

use lib qw(../../lib);

use parent qw( PA::Persona);


sub new {
	my $class = shift;
	my $dni = shift || croak "Todos tenemos Dni";
    my $nombre = shift || croak "Sin nombre?";
    my $email = shift || croak "Importante\n";
	my $curso = shift || croak "Matricúlate\n";
    my $mensualidad = shift || croak "Para cobrar\n"; 
    my $self = {DNI =>  $dni,
		 NOMBRE => $nombre,
		 EMAIL=> $email,
		 CURSO => $curso,
		 MENSUALIDAD => $mensualidad};
    bless $self,$class;
    return $self;
}

sub to_string{
    my $self = shift;
    return $self->SUPER::to_string.'Curso:'.$self->{'CURSO'}."\n".
    'Mensualidad:'.$self->{'MENSUALIDAD'}."\n";
}



"alumnos";
