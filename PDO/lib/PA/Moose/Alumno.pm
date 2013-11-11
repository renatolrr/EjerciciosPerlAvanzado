package PA::Moose::Alumno;

use strict;
use warnings;

use Carp qw(croak);

use lib qw(../../lib);
use Moose;

extends 'PA::Moose::Persona';

has 'curso', is =>'ro', isa => 'Str';
has 'mes', is =>'ro', isa => 'Int';

sub resultado {
  my $self = shift;
  return  ($self->curso,$self->mes);
}

override to_string => sub {
    my $self = shift;
    return super()."\nCurso: ".$self->curso."\nMensualidad: ".$self->mes;
};

"Ea!";
