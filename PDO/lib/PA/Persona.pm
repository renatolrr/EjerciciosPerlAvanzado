package PA::Persona;

use strict;
use warnings;

use Carp qw(croak);

sub new {
  my $class = shift;
  my $dni = shift || croak "Todos tenemos Dni";
  my $nombre = shift || croak "Sin nombre?";
  my $email = shift || croak "Importante\n";
  my $self =  {  DNI =>  $dni,
		 NOMBRE => $nombre,
		 EMAIL=> $email,		 
	      };
  bless $self; 
  return $self;
}

sub to_string{
    my $self = shift;
    return 'Dni:'.$self->{'DNI'}."\n".'Nombre:'.$self->{'NOMBRE'}."\n".
    'Email:'.$self->{'EMAIL'}."\n";
}

"Todos somos personas";
