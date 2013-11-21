package PA::Moose::Persona;

use strict;
use warnings;

use Carp qw(croak);

use Moose;

has 'dni', is =>'ro', isa => 'Str', required => 1;
has 'nombre', is =>'ro', isa => 'Str', required => 1;
has 'email', is =>'ro', isa => 'Str', required => 1;


sub to_string{
    my $self = shift;
    return 'Dni:' . $self->dni . "\n".'Nombre:' . $self->nombre . "\n" . 'Email:'.$self->email;
}

"Persona"; 
