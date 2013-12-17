#!/usr/bin/perl
# Los ejercicios están en https://github.com/renatolrr/EjerciciosPerlAvanzado

use strict;
use warnings;

use v5.10;
use DBI;
use SQL::Abstract;

print "Fase II\n"; 
print "Tanatocreación.\n"; 
print "Apunta el Estado Inmortal +3 y la Competencia Cosecha 2. Añade la puntuación de 1 a todas
las Competencias básicas ya escritas en la hoja de personaje. Tira 1d10 +20 para calcular el Fondo de Karma y apunta 3
en el Fondo de Acción (Impacto Narrativo 3).\n";
print "a) Virtud. Elige una, apunta los Estados de Conflicto a +10 que proporciona -sin olvidarte del asterisco- y pro-
cura que te quede claro el concepto para luego poder utilizar el Fondo de Acción con estos Estados.\n";
print "b) Estrella Fija. Elige una o determínala al azar. Apunta tres Estados con +3, +2 y +1. Puedes crear Estados
Llave.\n";

my $bd_file_name = shift || 'personaje.sqlite';


my $sql = SQL::Abstract->new;


my %record = (
        estado_1   => "Inmortal +3",
);

my $dbh = DBI->connect( "dbi:SQLite:dbname=$bd_file_name" ) 
    || die "No puedo conectarme con $bd_file_name: $!\n";
my($stmt, @bind) = $sql-> insert ('estados',\%record);

my $sth = $dbh->prepare($stmt);
$sth->execute( @bind );

my $rc = $dbh->disconnect();
