#!/usr/bin/perl

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
my($stmt, @bind) = $sql-> delete('alumno',\%where);

my $sth = $dbh->prepare($stmt);
$sth->execute( @bind );


my $rc = $dbh->disconnect();



