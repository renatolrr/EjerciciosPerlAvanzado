#!/usr/bin/perl
# Ficheros en https://github.com/renatolrr/EjerciciosPerlAvanzado 

use DBI;

my $dbh = DBI->connect("dbi:SQLite:dbname=historico.sqlite");

$dbh->do("create table hist ( tabla VARCHAR(12),proc VARCHAR(12), dni VARCHAR(12), nombre VARCHAR(80), email VARCHAR(40), variableA VARCHAR(40), variableB INTEGER );")

or die "No puedo conectarme ".$dbh->errstr;

my $rc = $dbh->disconnect()
