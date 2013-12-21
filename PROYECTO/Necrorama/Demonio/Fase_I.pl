#!/usr/bin/perl
# Los ejercicios están en https://github.com/renatolrr/EjerciciosPerlAvanzado

use strict;
use warnings;

use v5.10;
use DBI;
use SQL::Abstract;

print "Fase I \n";
print "Existencia.\n";
print "Apunta el Estado Inmortal +5. Añade la puntuación de 3 a todas las Competencias básicas como si
fuese un humano o un necrólito. Tira 2d10 +30 para calcular el Fondo de Karma y apunta 5 en el Fondo de Acción.
\n";
print "a) Virtud. Selecciona cinco Estados de Conflicto a +10 -sin olvidarte del asterisco-, de cualquiera de las Virtu-
des de necrólito.\n";
print "b) Elige tres Estados cualesquiera de entre todos los disponibles en el apartado Estrella Fija y asígnales pun-
tuaciones de +4, +2 y +1. Puedes crear Estados Llave que reflejen la motivación e intereses del demonio.
Elige otros tres Estados especiales a +4, +2 y +1 que reflejen el componente sobrenatural del demonio.
Puedes seleccionarlos de los Estados que tienen las criaturas del bestiario, o inventar nuevos.
\n";
print "c) Demonomancia: elige cinco Arcanos. Coloca a cada uno puntuación de 8, 6, 5, 4 y 3. Todo demonio esgrime
magia de Licenciado.
\n";


my $bd_file_name = shift || '../personaje.sqlite';


my $sql = SQL::Abstract->new;


print "Nick\n";
my $nick=<STDIN>;

my %where= (
        nick => $nick
);


# Estado inmortal +5
my %fieldvals = (
        estado_1 => "Inmortal +5",
);

my $dbh = DBI->connect( "dbi:SQLite:dbname=$bd_file_name" )
    || die "No puedo conectarme con $bd_file_name: $!\n";
my($stmt, @bind) = $sql-> update ('estados',\%fieldvals,\%where);
my $sth = $dbh->prepare($stmt);
$sth->execute( @bind );


# Añade la puntuación de 3 a todas las Competencias básicas
my %fieldvals= (
                advertir 		=> "Advertir 3",
                aguante			=> "Aguante 3",
                astucia			=> "Astucia 3",
                atletismo		=> "Atletismo 3",
                frialdad		=> "Frialdad 3",
);


my($stmt, @bind) = $sql-> update ('competencias',\%fieldvals,\%where);
my $sth = $dbh->prepare($stmt);
$sth->execute( @bind );


#Tira 1d10 +30  para calcular el Fondo de Karma
#Fondo de Acción (Impacto Narrativo 5)


my $rand= int(rand(10)) + 31;
$rand +=int(rand(10)) ;


%fieldvals = (
                fondo_accion        => 5,
                fondo_karma			=> $rand
);

($stmt, @bind) = $sql-> update ('otros',\%fieldvals,\%where);
$sth = $dbh->prepare($stmt);
$sth->execute( @bind );

# a) Virtud 


my $rc = $dbh->disconnect();
