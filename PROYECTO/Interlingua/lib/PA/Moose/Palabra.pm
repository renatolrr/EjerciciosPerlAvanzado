package PA::Moose::Palabra;

use Carp qw(croak);

use Moose;

has 'palabra', is =>'ro', isa => 'Str', required => 1;


sub to_string{
    my $self = shift;
    return ' Palabra:' . $self->palabra;
}
#diccionario
sub diccionario {
	my $self = shift;
	#abre fichero
	open(f1, 'iaes.txt');
	my @datos=<f1>;
	close(f1);
	#analiza
	my $x;
	my $p = $self->palabra;	
	my $resultado;
	for($x=0; $x <=@datos; $x += 1){
		if (defined $datos[$x] && $datos[$x] =~ m/=\s(${p})\s/){
			#print $datos[$x];
			$resultado = $resultado . $datos[$x];
		}
	}
	return $resultado;
}
#sinonimo
sub sinonimo{
	my $self = shift;
	#abre fichero
	open(f1, 'DICTIONARIO DE SYNONYMOS 2013.txt');
	my @datos=<f1>;
	close(f1);
	#analiza
	my $x;
	my $p = $self->palabra;
	my $resultado;	
	for($x=0; $x <=@datos; $x += 1){
		if (defined $datos[$x] && $datos[$x] =~ m/(·\s${p})\s/){
			$datos[$x] =~ s/(·\s)/\n/g;
			$datos[$x] =~ s/(\s\:\s)/\n/g;
			#print $datos[$x];
			$resultado = $resultado . $datos[$x];
		}
	}
	return $resultado;
}
#tesauro
sub tesauro {
	my $self = shift;
	#abre fichero
	open(f1, 'THESAURO_2013.txt');
	my @datos=<f1>;
	close(f1);
	#analiza
	my $x;
	my $p = $self->palabra;
	my $resultado;	
	for($x=0; $x <=@datos; $x += 1){
		if (defined $datos[$x] && $datos[$x] =~ m/(·\s${p})\s/){
			#print  split("· ",$datos[$x]);
			$resultado = $resultado . $datos[$x];
		}
	}
	return split("· ",$resultado);
}
1; 
