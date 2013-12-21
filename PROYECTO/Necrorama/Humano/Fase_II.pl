#!/usr/bin/perl
# Los ejercicios están en https://github.com/renatolrr/EjerciciosPerlAvanzado

use strict;
use warnings;

use v5.10;
use DBI;
use SQL::Abstract;

print "Fase II\n";
print "Tanatocreación.\n";
print "Añade la puntuación de 1 a todas las Competencias básicas ya escritas en la hoja de persona-
je. Tira 1d10 para calcular el Fondo de Karma y apunta 2 en el Fondo de Acción.\n";
print "a) Virtud. Elige una, apunta los Estados de Conflicto a +10 que proporciona -sin olvidarte del asterisco- y pro-
cura que te quede claro el concepto para luego poder utilizar el Fondo de Acción.\n";
print "b) Elige dos Estados cualesquiera de entre todos los disponibles en el apartado Estrella Fija y asígnales pun-
tuaciones de +2 y +1. Puedes crear Estados Llave.\n";


my $bd_file_name = shift || '../personaje.sqlite';


my $sql = SQL::Abstract->new;


print "Nick\n";
my $nick=<STDIN>;

my %where= (
        nick => $nick
);


# Añade la puntuación de 1 a todas las Competencias básicas
my %fieldvals= (
                advertir 		=> "Advertir 1",
                aguante			=> "Aguante 1",
                astucia			=> "Astucia 1",
                atletismo		=> "Atletismo 1",
                frialdad		=> "Frialdad 1",
);

my $dbh = DBI->connect( "dbi:SQLite:dbname=$bd_file_name" )
    || die "No puedo conectarme con $bd_file_name: $!\n";
my($stmt, @bind) = $sql-> update ('competencias',\%fieldvals,\%where);
my $sth = $dbh->prepare($stmt);
$sth->execute( @bind );


#Tira 1d10   para calcular el Fondo de Karma
#Fondo de Acción (Impacto Narrativo 2)


my $rand= int(rand(10)) + 1;


%fieldvals = (
                fondo_accion        => 2,
                fondo_karma			=> $rand
);

($stmt, @bind) = $sql-> update ('otros',\%fieldvals,\%where);
$sth = $dbh->prepare($stmt);
$sth->execute( @bind );

# a) Virtud aleatorio

$rand= int(rand(7))+1;

my $virtud=$rand;

my %where= (
	rowid => $virtud
);

($stmt, @bind) = $sql-> select ('virtud','estados',\%where);
$sth = $dbh->prepare($stmt);
$sth->execute( @bind );
my $ary = $sth->fetchall_arrayref;
say "Tenemos a: ";
for (@$ary){
	print @$_;
	print "\n";
	my $estados_virtud = @$_;
}



my $rc = $dbh->disconnect();
