#!/usr/bin/perl
# Ficheros en https://github.com/renatolrr/EjerciciosPerlAvanzado 

use strict;
use warnings;

use v5.10;
use DBI;
use SQL::Abstract;

my $bd_file_name = shift || 'academia.sqlite';


my $sql = SQL::Abstract->new;

print "Dni del Profesor\n";
my $dni=<STDIN>;
print "Nombre del Profesor\n";
my $nombre=<STDIN>;
print "Email\n";
my $email=<STDIN>;
print "Numero de clases\n";
my $nclases=<STDIN>;
print "A facturar\n";
my $factura=<STDIN>;
	
my %record = (
        dni         => $dni,
        nombre      => $nombre,
        email       => $email,
        variableA   => $nclases,
        variableB   => $factura
);



my $dbh = DBI->connect( "dbi:SQLite:dbname=$bd_file_name" ) 
    || die "No puedo conectarme con $bd_file_name: $!\n";
my($stmt, @bind) = $sql-> insert ('profesor',\%record);

my $sth = $dbh->prepare($stmt);
$sth->execute( @bind );

my $rc = $dbh->disconnect();

#historico
my $sql2 = SQL::Abstract->new; 
my %histo = (
		tabla       => 'profesor',
        proc        => 'on',	
        dni         => $dni,
        nombre      => $nombre,
        email       => $email,
        variableA   => $nclases,
        variableB   => $factura
);

$dbh = DBI->connect( "dbi:SQLite:dbname=historico.sqlite" ) 
    || die "No puedo conectarme con $bd_file_name: $!\n";
($stmt, @bind) = $sql2-> insert ('hist',\%histo);

$sth = $dbh->prepare($stmt);
$sth->execute( @bind );

$rc = $dbh->disconnect();

