#!/usr/bin/perl
# Ficheros en https://github.com/renatolrr/EjerciciosPerlAvanzado 

use DBI;

#variableA y variableB se utilizan para curso o mensualidad

my $dbh = DBI->connect("dbi:SQLite:dbname=academia.sqlite");

$dbh->do("create table alumno ( dni VARCHAR(12), nombre VARCHAR(80), email VARCHAR(40), variableA VARCHAR(40), variableB INTEGER );")

or die "No puedo conectarme ".$dbh->errstr;

my $rc = $dbh->disconnect()
