#!/usr/bin/perl
# Ficheros en https://github.com/renatolrr/EjerciciosPerlAvanzado 

use strict;
use warnings;

use v5.10;
use DBI;
use SQL::Abstract;

my $bd_file_name = shift || 'academia.sqlite';


my $sql = SQL::Abstract->new;


print "Dni del alumno:\n";
my $dni=<STDIN>;

my %where= (
	dni => $dni
);
	

my $dbh = DBI->connect( "dbi:SQLite:dbname=$bd_file_name" ) 
    || die "No puedo conectarme con $bd_file_name: $!\n";
    
    
#consulta
my($stmt, @bind) = $sql-> select ('alumno','*',\%where);

my $sth = $dbh->prepare($stmt);
$sth->execute( @bind );

my $ary = $sth->fetchall_arrayref;
#say "Tenemos a: ";
my @captura;

for (@$ary){
	#print @$_;
	push(@captura,@$_);  
	#print "\n";
}
#borrar
($stmt, @bind) = $sql-> delete('alumno',\%where);

$sth = $dbh->prepare($stmt);
$sth->execute( @bind );


my $rc = $dbh->disconnect();

#historico
my $sql2 = SQL::Abstract->new; 
my %histo = (
		tabla       => 'alumno',
        proc        => 'off',	
        dni         => $captura[0],
        nombre      => $captura[1],
        email       => $captura[2],
        variableA   => $captura[3],
        variableB   => $captura[4]
);

$dbh = DBI->connect( "dbi:SQLite:dbname=historico.sqlite" ) 
    || die "No puedo conectarme con $bd_file_name: $!\n";
($stmt, @bind) = $sql2-> insert ('hist',\%histo);

$sth = $dbh->prepare($stmt);
$sth->execute( @bind );

$rc = $dbh->disconnect();







