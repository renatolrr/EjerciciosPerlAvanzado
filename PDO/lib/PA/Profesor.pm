package PA::Profesor;

use strict;
use warnings;

use Carp qw(croak);

use lib qw(../../lib);

use parent qw(PA::Persona);


sub new {
	my $class = shift;
	my $dni = shift || croak "Todos tenemos Dni";
    my $nombre = shift || croak "Sin nombre?";
    my $email = shift || croak "Importante\n";
	my $nclases = shift || croak "Numero de clases\n";
    my $factura = shift || croak "Para pagar\n"; 
    my $self = {DNI =>  $dni,
		 NOMBRE => $nombre,
		 EMAIL=> $email,
		 NCLASES => $nclases,
		 FACTURA => $factura};
    bless $self,$class;
    return $self;
}

sub to_string{
    my $self = shift;
    return $self->SUPER::to_string.'Numero de clases:'.$self->{'NCLASES'}."\n".
    'A facturar:'.$self->{'FACTURA'}."\n";
}



"profe";
