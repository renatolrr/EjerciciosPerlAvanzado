#!/usr/bin/perl
# Ficheros en https://github.com/renatolrr/EjerciciosPerlAvanzado 

use DBI;

my $dbh = DBI->connect("dbi:SQLite:dbname=academia.sqlite");

$dbh->do("create table profesor ( dni VARCHAR(12), nombre VARCHAR(80), email VARCHAR(40), nclases INTEGER, factura FLOAT );")

or die "No puedo conectarme ".$dbh->errstr;

my $rc = $dbh->disconnect()
