package PA::Persona;

use strict;
use warnings;

use Carp qw(croak);

sub new {
  my $class = shift;
  my $dni = shift || croak "Todos tenemos Dni";
  my $nombre = shift || croak "Sin nombre?";
  my $email = shift || croak "Importante\n";
  my $curso = shift || croak "Matricúlate\n";
  my $mensualidad = shift || croak "Para cobrar\n"; 
  my $self =  {  DNI =>  $dni,
		 NOMBRE => $nombre,
		 EMAIL=> $email,
		 CURSO => $curso,
		 MENSUALIDAD => $mensualidad
	      };
  bless $self; 
  return $self;
}

sub to_string{
    my $self = shift;
    return 'Dni:'.$self->{'DNI'}."\n".'Nombre:'.$self->{'NOMBRE'}."\n".
    'Email:'.$self->{'EMAIL'}."\n".'Curso:'.$self->{'CURSO'}."\n".
    'Mensualidad:'.$self->{'MENSUALIDAD'}."\n";
}

"Todos somos personas";
