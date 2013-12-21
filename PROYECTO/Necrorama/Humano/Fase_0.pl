#!/usr/bin/perl
# Los ejercicios están en https://github.com/renatolrr/EjerciciosPerlAvanzado

use strict;
use warnings;

use v5.10;
use DBI;
use SQL::Abstract;

print "Fase 0\n";
print "Tu nick.\n";


my $bd_file_name = shift || '../personaje.sqlite';


my $sql = SQL::Abstract->new;


print "Nick\n";
my $nick=<STDIN>;
	
my %record = (
		nick      => $nick,
		tipo      => 'humano',
);

my $table='personaje';

	my $dbh = DBI->connect( "dbi:SQLite:dbname=$bd_file_name" ) 
		|| die "No puedo conectarme con $bd_file_name: $!\n";

	my($stmt, @bind) = $sql-> insert ($table,\%record);
	my $sth = $dbh->prepare($stmt);
	$sth->execute( @bind );

	

%record = (
		nick      => $nick,
);
	
$table='estados';

	($stmt, @bind) = $sql-> insert ($table,\%record);
	$sth = $dbh->prepare($stmt);
	$sth->execute( @bind );

	
$table='competencias';

	($stmt, @bind) = $sql-> insert ($table,\%record);
	$sth = $dbh->prepare($stmt);
	$sth->execute( @bind );

	
$table='otros';

	($stmt, @bind) = $sql-> insert ($table,\%record);
	$sth = $dbh->prepare($stmt);
	$sth->execute( @bind );
	
$table='accion';

	($stmt, @bind) = $sql-> insert ($table,\%record);
	$sth = $dbh->prepare($stmt);
	$sth->execute( @bind );

	
$table='arcanos';

	($stmt, @bind) = $sql-> insert ($table,\%record);
	$sth = $dbh->prepare($stmt);
	$sth->execute( @bind );

	
$table='extras';

	($stmt, @bind) = $sql-> insert ($table,\%record);
	$sth = $dbh->prepare($stmt);
	$sth->execute( @bind );

	my $rc = $dbh->disconnect();



