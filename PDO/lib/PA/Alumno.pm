package PA::Alumno;

use strict;
use warnings;

sub new {
    my $self = {NOMBRE => 'pepe',APELLIDOS=>'rodriguez'};
    bless $self;
    return $self;
}

sub datos {
  my $self = shift;
  return $self->{'NOMBRE'}.$self->{'APELLIDOS'};
}

"Que sí!";
