package PA::Simple;

use strict;
use warnings;

sub new {
    my $self = {DATOS => rand()};
    bless $self;
    return $self;
}

sub datos {
  my $self = shift;
  return $self->{'DATOS'};
}

"Que sí!";
