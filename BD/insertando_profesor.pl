#!/usr/bin/perl

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
        nclases     => $nclases,
        factura     => $factura
);



my $dbh = DBI->connect( "dbi:SQLite:dbname=$bd_file_name" ) 
    || die "No puedo conectarme con $bd_file_name: $!\n";
my($stmt, @bind) = $sql-> insert ('profesor',\%record);

my $sth = $dbh->prepare($stmt);
$sth->execute( @bind );

my $rc = $dbh->disconnect();

