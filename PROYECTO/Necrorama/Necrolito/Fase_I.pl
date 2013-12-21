#!/usr/bin/perl
# Los ejercicios están en https://github.com/renatolrr/EjerciciosPerlAvanzado


use strict;
use warnings;

use v5.10;
use DBI;
use SQL::Abstract;

print "Fase I\n";
print "Vida previa.\n";
print "Redacta el texto de un obituario, lápida o necrológica que se haga eco de la muerte de tu personaje
en la Tierra.\n";

my $bd_file_name = shift || 'personaje.sqlite';


my $sql = SQL::Abstract->new;


print "Nick\n";
my $nick=<STDIN>;

my %where= (
	id => $nick
);

print "Vida anterior\n";
my $vida_anterior=<STDIN>;

my %fieldvals = (
	vida_anterior => $vida_anterior,
);

my $table='personaje';
	
update();

sub update{
	my $dbh = DBI->connect( "dbi:SQLite:dbname=$bd_file_name" ) 
		|| die "No puedo conectarme con $bd_file_name: $!\n";
	my($stmt, @bind) = $sql-> update ($table,\%fieldvals,\%where);

	my $sth = $dbh->prepare($stmt);
	$sth->execute( @bind );


	my $rc = $dbh->disconnect();
}





