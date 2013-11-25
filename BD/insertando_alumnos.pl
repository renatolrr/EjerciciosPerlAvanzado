#!/usr/bin/perl
# Ficheros en https://github.com/renatolrr/EjerciciosPerlAvanzado 

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
        variableA   => $curso,
        variableB   => $mes
);



my $dbh = DBI->connect( "dbi:SQLite:dbname=$bd_file_name" ) 
    || die "No puedo conectarme con $bd_file_name: $!\n";
my($stmt, @bind) = $sql-> insert ('alumno',\%record);

my $sth = $dbh->prepare($stmt);
$sth->execute( @bind );

my $rc = $dbh->disconnect();

#historico
my $sql2 = SQL::Abstract->new; 
my %histo = (
		tabla       => 'alumno',
        proc        => 'on',	
        dni         => $dni,
        nombre      => $nombre,
        email       => $email,
        variableA   => $curso,
        variableB   => $mes
);

$dbh = DBI->connect( "dbi:SQLite:dbname=historico.sqlite" ) 
    || die "No puedo conectarme con $bd_file_name: $!\n";
($stmt, @bind) = $sql2-> insert ('hist',\%histo);

$sth = $dbh->prepare($stmt);
$sth->execute( @bind );

$rc = $dbh->disconnect();



