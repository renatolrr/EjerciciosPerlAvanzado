package PA::Moose::Personaje;

use Carp qw(croak);

use Moose;
use DBI;
use SQL::Abstract;

		

has 'nick', is =>'rw', isa => 'Str', required => 1;
has 'tipo', is =>'rw', isa => 'Str', required => 1;


sub to_string{
    my $self = shift; 
    return 'Nick:' . $self->nick . "\n" . 'Tipo:' . $self->tipo;
}

#grabar nick personaje
sub crea_personaje {
	my $self = shift;
	my $nick =$self->nick;
	my $tipo =$self->tipo;
	
	my $bd_file_name = shift || 'personaje.sqlite';
	my $sql = SQL::Abstract->new;

	my %record = (
			nick      => $nick,
			tipo      => $tipo,
	);

	my $table='personaje';

	my $dbh = DBI->connect( "dbi:SQLite:dbname=$bd_file_name" ) 
		|| die "No puedo conectarme con $bd_file_name: $!\n";
	my($stmt, @bind) = $sql-> insert ($table,\%record);
	my $sth = $dbh->prepare($stmt);
	$sth->execute( @bind );

	%record = (
			nick      => $nick,
	);
		
	$table='estados';

		($stmt, @bind) = $sql-> insert ($table,\%record);
		$sth = $dbh->prepare($stmt);
		$sth->execute( @bind );

		
	$table='competencias';

		($stmt, @bind) = $sql-> insert ($table,\%record);
		$sth = $dbh->prepare($stmt);
		$sth->execute( @bind );

		
	$table='otros';

		($stmt, @bind) = $sql-> insert ($table,\%record);
		$sth = $dbh->prepare($stmt);
		$sth->execute( @bind );
		
	$table='accion';

		($stmt, @bind) = $sql-> insert ($table,\%record);
		$sth = $dbh->prepare($stmt);
		$sth->execute( @bind );

		
	$table='arcanos';

		($stmt, @bind) = $sql-> insert ($table,\%record);
		$sth = $dbh->prepare($stmt);
		$sth->execute( @bind );

		
	$table='extras';

		($stmt, @bind) = $sql-> insert ($table,\%record);
		$sth = $dbh->prepare($stmt);
		$sth->execute( @bind );

		
	#Estado inicial
	my $inmortal;
	
	if ($tipo eq 'necrolito'){
		$inmortal='Inmortal +3';
	}
	elsif($tipo eq 'demonio'){
		$inmortal='Inmortal +5';	
	}
	my %where= (
        nick => $nick,
	);
	
	my %fieldvals = (
        estado_1 => $inmortal,
	);

	($stmt, @bind) = $sql-> update ('estados',\%fieldvals,\%where);
	$sth = $dbh->prepare($stmt);
	$sth->execute( @bind );
	
	#Competencia básica
	if ($tipo eq 'necrolito'){
		%fieldvals= (
					advertir 		=> "Advertir 1",
					aguante			=> "Aguante 1",
					astucia			=> "Astucia 1",
					atletismo		=> "Atletismo 1",
					frialdad		=> "Frialdad 1",
					competencia_1 	=> "Cosecha 2",
		);
	}
	elsif ($tipo eq 'humano'){
		%fieldvals= (
					advertir 		=> "Advertir 1",
					aguante			=> "Aguante 1",
					astucia			=> "Astucia 1",
					atletismo		=> "Atletismo 1",
					frialdad		=> "Frialdad 1",
		);
	}
	else{
		%fieldvals= (
					advertir 		=> "Advertir 3",
					aguante			=> "Aguante 3",
					astucia			=> "Astucia 3",
					atletismo		=> "Atletismo 3",
					frialdad		=> "Frialdad 3",
		);
	}
	($stmt, @bind) = $sql-> update ('competencias',\%fieldvals,\%where);
	$sth = $dbh->prepare($stmt);
	$sth->execute( @bind );
	
	#Fondo de Karma
	#Fondo de Acción (Impacto Narrativo)
	my $rand;
	my $fondo_accion;
	if ($tipo eq 'necrolito'){			
		$rand= int(rand(10)) + 21;
		$fondo_accion = 3;
	}
	elsif($tipo eq 'humano'){
		$rand= int(rand(10)) + 1;
		$fondo_accion = 2;
	}
	else{
		$rand= int(rand(10)) + 31;
		$rand +=int(rand(10)) ;
		$fondo_accion = 5;
		
	};
	%fieldvals = (
					fondo_accion        => $fondo_accion,
					fondo_karma			=> $rand
	);

	($stmt, @bind) = $sql-> update ('otros',\%fieldvals,\%where);
	$sth = $dbh->prepare($stmt);
	$sth->execute( @bind );
	
	my $rc = $dbh->disconnect();
}


1; 
