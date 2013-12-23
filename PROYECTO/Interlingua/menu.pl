#!/usr/bin/perl
# Los ejercicios están en https://github.com/renatolrr/EjerciciosPerlAvanzado

use strict;
use warnings;

use v5.10;
use DBI;
use SQL::Abstract;

use lib qw(lib);

use Tk;
use PA::Moose::Palabra;
use utf8; #problema acentos

my $bd_file_name = shift || 'interlingua.sqlite';
my $sql = SQL::Abstract->new;

my $palabra;
my $text;

my $ventana = new MainWindow;
$ventana->title('Interlingua');
$ventana->geometry("600x700"); # damos el tamaño en anchura y altura
#$ventana->resizable( 0, 0 ); #  no dejaremos que la redimensionen

my $menu = $ventana->Menu(-type => 'menubar');
$ventana->configure(-menu => $menu);

my $mUno = $menu->cascade(-label => '~Archivo', -tearoff => 0);
#$mUno->command(-label => '~Abrir', -command => \&func1);
#$mUno->command(-label => '~Guardar', -command => \&func2);
$mUno->command(-label => '~Salir', -command => \&func3);

my $mDos = $menu->cascade(-label => '~Edición', -tearoff => 0);
$mDos->command(-label => '~Borrar texto', -command => \&func4);


my $mTres= $menu->cascade(-label => '~Texto', -tearoff => 0);
$mTres->command(-label => '~Guardar', -command => \&func5);
$mTres->command(-label => '~Histórico guardados', -command => \&func6);


my $mAyuda = $menu->cascade(-label => '~Ayuda', -tearoff => 0);
$mAyuda->command(-label => '~Acerca de...', -command => \&func7);

$ventana->Label(-text => "Texto")->pack(); 
my $ent_texto= $ventana -> Text(-width=>140, -height=>1) -> pack();

$ventana->Label(-text => "Busqueda palabra")->pack(); 
my $ent = $ventana -> Entry() -> pack();

my $boton = $ventana ->Button(-text=>"resuelve", -command =>\&resuelve);
$boton->pack();
$ventana->Label(-text => "Diccionario")->pack(); 
my $dic = $ventana -> Text(-width=>40, -height=>5) -> pack();
$ventana->Label(-text => "Sinonimo")->pack(); 
my $sin = $ventana -> Text(-width=>40, -height=>10) -> pack();
$ventana->Label(-text => "Tesauro")->pack(); 
my $tes = $ventana -> Text(-width=>40, -height=>20) -> pack();
$ventana->Label(-text => "Texto")->pack(); 
my $text2 = $ventana -> Text(-width=>40, -height=>5) -> pack();
MainLoop;

sub func1{
	$ventana -> messageBox(-type=>"ok", -message=>'Renato Ramirez' . "\n" . 
	'renatolrr@gmail.com' . "\n" .  
	"https://github.com/renatolrr/EjerciciosPerlAvanzado");
	
}
sub func2{
	$ventana -> messageBox(-type=>"ok", -message=>'Renato Ramirez' . "\n" . 
	'renatolrr@gmail.com' . "\n" .  
	"https://github.com/renatolrr/EjerciciosPerlAvanzado"); 

    
}

sub func3{
	#$ventana -> messageBox(-type=>"ok", -message=>"Has elegido Salir");
         exit();
}
sub func4{
	$ventana -> messageBox(-type=>"ok", -message=>'Renato Ramirez' . "\n" . 
	'renatolrr@gmail.com' . "\n" .  
	"https://github.com/renatolrr/EjerciciosPerlAvanzado");
}
sub func5{
	my $fecha = time();
	my $tmp = $ent_texto->get('0.0','end');
	my %record = (
        fecha         	=> $fecha,
        texto      		=> $tmp,
        estado       	=> 0
  	);
	my $dbh = DBI->connect( "dbi:SQLite:dbname=$bd_file_name" ) 
		|| die "No puedo conectarme con $bd_file_name: $!\n";
	my($stmt, @bind) = $sql-> insert ('twitter_interlingua',\%record);
	my $sth = $dbh->prepare($stmt);
	$sth->execute( @bind );
	my $rc = $dbh->disconnect();

	
}
sub func6{
	my $dbh = DBI->connect( "dbi:SQLite:dbname=$bd_file_name" ) 
    || die "No puedo conectarme con $bd_file_name: $!\n";
	my $ary = $dbh->selectall_arrayref('select texto from twitter_interlingua');
	my $men;
	for (@$ary){
		$men = $men . join ("\t",@$_);
		}
	$ventana -> messageBox(-type=>"ok", -message=> $men );
	
}
sub func7{
	$ventana -> messageBox(-type=>"ok", -message=>'Renato Ramirez' . "\n" . 
	'renatolrr@gmail.com' . "\n" .  
	"https://github.com/renatolrr/EjerciciosPerlAvanzado");
}

sub resuelve{
	my $temp=$ent->get();
	my $palabra = new PA::Moose::Palabra ( palabra => $temp);
	#borra
	$dic->delete('0.0',"end");
	$sin->delete('0.0',"end");
	$tes->delete('0.0',"end");
	
	#resuelve
    $dic ->insert("end", $palabra->diccionario);
    $sin->insert("end", $palabra->sinonimo);
    $tes ->insert("end", $palabra->tesauro);
}
