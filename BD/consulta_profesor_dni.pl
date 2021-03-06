#!/usr/bin/perl
# Ficheros en https://github.com/renatolrr/EjerciciosPerlAvanzado 

use strict;
use warnings;

use v5.10;
use DBI;
use SQL::Abstract;

my $bd_file_name = shift || 'academia.sqlite';


my $sql = SQL::Abstract->new;

my @fields = qw (nombre email);

print "Dni del Profesor:\n";
my $dni=<STDIN>;

my %where= (
	dni => $dni
);
	

my $dbh = DBI->connect( "dbi:SQLite:dbname=$bd_file_name" ) 
    || die "No puedo conectarme con $bd_file_name: $!\n";
my($stmt, @bind) = $sql-> select ('profesor','*',\%where);

my $sth = $dbh->prepare($stmt);
$sth->execute( @bind );

my $ary = $sth->fetchall_arrayref;
say "Tenemos a Don: ";
map((say join("\t",@$_)),@$ary);



