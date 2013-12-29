#!/usr/bin/perl
# Los ejercicios están en https://github.com/renatolrr/EjerciciosPerlAvanzado

use strict;
use warnings;

use v5.10;
use DBI;
use SQL::Abstract;

use lib qw(lib);

use Tk;
use PA::Moose::Personaje;
use utf8; #problema acentos

my $bd_file_name = shift || 'personaje.sqlite';
my $sql = SQL::Abstract->new;

my $ventana = new MainWindow;
$ventana->title('Necrorama');
$ventana->geometry("600x700"); # damos el tamaño en anchura y altura
#$ventana->resizable( 0, 0 ); #  no dejaremos que la redimensionen

my $menu = $ventana->Menu(-type => 'menubar');
$ventana->configure(-menu => $menu);

my $mUno = $menu->cascade(-label => '~Archivo', -tearoff => 0);
$mUno->command(-label => '~Salir', -command => \&func1);

my $mDos = $menu->cascade(-label => '~Edición', -tearoff => 0);
$mDos->command(-label => '~Todos personajes', -command => \&func6);

my $mAyuda = $menu->cascade(-label => '~Ayuda', -tearoff => 0);
$mAyuda->command(-label => '~Acerca de...', -command => \&func7);

$ventana->Label(-text => "Numero personaje")->pack(); 
my $ent = $ventana -> Entry() -> pack();

my $boton = $ventana ->Button(-text=>"Busca", -command =>\&encuentra);
$boton->pack();
$ventana->Label(-text => "Tipo")->pack(); 
my $tipo = $ventana -> Text(-width=>40, -height=>1) -> pack();
$ventana->Label(-text => "Estados")->pack(); 
my $estados = $ventana -> Text(-width=>40, -height=>1) -> pack();
$ventana->Label(-text => "Competencias")->pack(); 
my $competencias = $ventana -> Text(-width=>40, -height=>6) -> pack();
$ventana->Label(-text => "Fondo de Karma")->pack(); 
my $fondo_karma = $ventana -> Text(-width=>40, -height=>1) -> pack();
$ventana->Label(-text => "Fondo de acción")->pack(); 
my $fondo_accion = $ventana -> Text(-width=>40, -height=>1) -> pack();
MainLoop;

sub func1{
	#$ventana -> messageBox(-type=>"ok", -message=>"Has elegido Salir");
         exit();
}
sub func6{
	
	my $dbh = DBI->connect( "dbi:SQLite:dbname=$bd_file_name" ) 
    || die "No puedo conectarme con $bd_file_name: $!\n";
	my $ary = $dbh->selectall_arrayref('select rowid, nick from personaje');
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


sub encuentra {
	my $num= $ent->get();
	my $dbh = DBI->connect( "dbi:SQLite:dbname=$bd_file_name" ) 
    || die "No puedo conectarme con $bd_file_name: $!\n";
    my $seleccion=('select tipo from personaje where rowid='.$num );
    
	my $ary = $dbh->selectall_arrayref($seleccion);
	my $men;
	for (@$ary){
		$men = $men . join ("\t",@$_);
		}
	$ventana -> messageBox(-type=>"ok", -message=> $men );
	$tipo ->delete('0.0',"end");
	$tipo ->insert("end", $men);
	
	$seleccion=( 'select estado_1 from estados where rowid='.$num);
	$ary=$dbh->selectall_arrayref($seleccion);
	for (@$ary){
		$men = join ("\t",@$_);
		}
	$estados ->delete('0.0',"end");
	$estados ->insert("end", $men);
	
	$seleccion= "select advertir, aguante, astucia, atletismo, frialdad, competencia_1 from competencias where rowid=".$num;
	$ary=$dbh->selectall_arrayref($seleccion);
	for (@$ary){
		$men = join ("\n",@$_);
		}
	$competencias ->delete('0.0',"end");
	$competencias ->insert("end", $men);


$seleccion= "select fondo_karma from otros where rowid=".$num;
	$ary=$dbh->selectall_arrayref($seleccion);
	for (@$ary){
		$men = join ("\n",@$_);
		}
	$fondo_karma ->delete('0.0',"end");
	$fondo_karma ->insert("end", $men);
	
	$seleccion= "select fondo_accion from otros where rowid=".$num;
	$ary=$dbh->selectall_arrayref($seleccion);
	for (@$ary){
		$men = join ("\n",@$_);
		}
	$fondo_accion ->delete('0.0',"end");	
	$fondo_accion ->insert("end", $men);
	
}


