package PA::Moose::Personaje;

use Carp qw(croak);

use Moose;
use DBI;
use SQL::Abstract;

extends 'PA::Moose::Personaje';

has 'nick', is =>'ro', isa => 'Str', required => 1;
has 'tipo', is =>'ro', isa => 'Str', required => 1;


sub to_string{
    my $self = shift; 
    return 'Nick:' . $self->nick . "\n" . 'Tipo:' . $self->tipo;
}

#grabar nick personaje
sub crea_nick_tablas {
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

		my $rc = $dbh->disconnect();
}


1; 
