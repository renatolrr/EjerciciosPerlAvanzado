#!/usr/bin/perl
# Ficheros en https://github.com/renatolrr/EjerciciosPerlAvanzado 

use v5.10;
use DBI;
use SQL::Abstract;
my @captura;

# quitar cometario si hay que crear tablas
#crear_tablas();

# quitar cometario para borrar datos
#borrar();

leer_historico();

tratar_captura();


#crea las tablas
sub crear_tablas{
	
	my $dbh = DBI->connect("dbi:SQLite:dbname=academia_new.sqlite");

	$dbh->do("create table alumno ( dni VARCHAR(12), nombre VARCHAR(80), email VARCHAR(40), variableA VARCHAR(40), variableB INTEGER );")

	or die "No puedo conectarme ".$dbh->errstr;

	$dbh->do("create table profesor ( dni VARCHAR(12), nombre VARCHAR(80), email VARCHAR(40), variableA VARCHAR(40), variableB INTEGER );")

	or die "No puedo conectarme ".$dbh2>errstr;

	my $rc = $dbh->disconnect();
}


#leer historico
sub leer_historico{
my $sql = SQL::Abstract->new;

my @fields ;

my %where= (
	
);

my $dbh = DBI->connect( "dbi:SQLite:dbname=historico.sqlite" ) 
    || die "No puedo conectarme con historico.sqlite\n";
my($stmt, @bind) = $sql-> select ('hist','*');

my $sth = $dbh->prepare($stmt);
$sth->execute( @bind );

my $ary = $sth->fetchall_arrayref;


for (@$ary){
	#print @$_;
	push(@captura,@$_);
	#print "\n";
};
my $rc = $dbh->disconnect();

}


#tratar captura

sub tratar_captura{
	my $i=0;
	my $tabla='';
	
	my $sql = SQL::Abstract->new;
	my $dbh = DBI->connect( "dbi:SQLite:dbname=academia_new.sqlite") 
				|| die "No puedo conectarme con academia_new.sqlite\n";
	
	for (@captura){
		if ($captura[$i] eq 'alumno'){
			$tabla = 'alumno';		
		}else{
			$tabla = 'profesor';
		}
		$i+=1;
		if($captura[$i] eq 'on'){
			$i+=1;
			my $dni = $captura[$i];
			$i+=1;
			my $nombre = $captura[$i];
			$i+=1;
			my $email = $captura[$i];
			$i+=1;
			my $curso = $captura[$i];
			$i+=1;
			my $mes= $captura[$i];
			my %record = (
						dni         => $dni,
						nombre      => $nombre,
						email       => $email,
						variableA   => $curso,
						variableB   => $mes
				);
			($stmt, @bind) = $sql-> insert ($tabla,\%record);
			$sth = $dbh->prepare($stmt);
			$sth->execute( @bind );
			$i+=1;
		}
		elsif($captura[$i] eq 'off'){
			$i+=1;
			my $dni = $captura[$i];
			my %where= (
				dni => $dni
			);	
			($stmt, @bind) = $sql-> delete($tabla,\%where);
			$sth = $dbh->prepare($stmt);
			$sth->execute( @bind );
			$i+=5;
		}
		elsif ($captura[$i] eq 'mod' ){
			$i+=1;
			my $dni = $captura[$i];
			my %where= (
				dni => $dni
			);
			$i+=4;
			my $mes=$captura[$i];
			my %fieldvals = (
				variableB => $mes,
			);
			($stmt, @bind) = $sql-> update ($tabla,\%fieldvals,\%where);
			$sth = $dbh->prepare($stmt);
			$sth->execute( @bind );			
			$i+=1;			
		}
	 }
	 my $rc = $dbh->disconnect();
}

sub borrar{
	my $sql = SQL::Abstract->new;
	my $dbh = DBI->connect( "dbi:SQLite:dbname=academia_new.sqlite");
	($stmt, @bind) = $sql-> delete('alumno');
	$sth = $dbh->prepare($stmt);
	$sth->execute( @bind );
	($stmt, @bind) = $sql-> delete('profesor');
	$sth = $dbh->prepare($stmt);
	$sth->execute( @bind );
	 
	 
}

