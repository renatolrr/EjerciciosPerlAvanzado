#!/usr/bin/perl
# Los ejercicios están en https://github.com/renatolrr/EjerciciosPerlAvanzado

use strict;
use warnings;

use v5.10;
use DBI;
use SQL::Abstract;

print "Fase 0\n";
print "Tu nombre.\n";


my $bd_file_name = shift || 'personaje.sqlite';


my $sql = SQL::Abstract->new;


print "Id\n";
my $id=<STDIN>;

print "Nombre\n";
my $nombre=<STDIN>;
	
my %record = (
		nombre      => $nombre,
);

my $dbh = DBI->connect( "dbi:SQLite:dbname=$bd_file_name" ) 
    || die "No puedo conectarme con $bd_file_name: $!\n";

my($stmt, @bind) = $sql-> insert ('personaje',\%record);

my $sth = $dbh->prepare($stmt);
$sth->execute( @bind );

my $rc = $dbh->disconnect();



