#!/usr/bin/perl

use strict;
use warnings;

use v5.10;
use DBI;
use SQL::Abstract;

my $bd_file_name = shift || 'academia.sqlite';


my $sql = SQL::Abstract->new;

print "Dni del Alumno\n";
my $dni=<STDIN>;
print "Nombre Alumno\n";
my $nombre=<STDIN>;
print "Email\n";
my $email=<STDIN>;
print "Curso\n";
my $curso=<STDIN>;
print "Couta mensual\n";
my $mes=<STDIN>;
	
my %record = (
        dni         => $dni,
        nombre      => $nombre,
        email       => $email,
        curso       => $curso,
        mensualidad => $mes
);



my $dbh = DBI->connect( "dbi:SQLite:dbname=$bd_file_name" ) 
    || die "No puedo conectarme con $bd_file_name: $!\n";
my($stmt, @bind) = $sql-> insert ('alumno',\%record);

my $sth = $dbh->prepare($stmt);
$sth->execute( @bind );

my $rc = $dbh->disconnect();

