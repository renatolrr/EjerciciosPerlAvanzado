#!/usr/bin/perl
# Los ejercicios están en https://github.com/renatolrr/EjerciciosPerlAvanzado

use lib qw(lib);

use Tk;
use PA::Moose::Palabra;
use utf8; #problema acentos

my $palabra;
my $text;

my $ventana = new MainWindow;
$ventana->title('Interlingua');
$ventana->geometry("600x700"); # damos el tamaño en anchura y altura
#$ventana->resizable( 0, 0 ); #  no dejaremos que la redimensionen

my $menu = $ventana->Menu(-type => 'menubar');
$ventana->configure(-menu => $menu);

my $mUno = $menu->cascade(-label => '~Archivo', -tearoff => 0);
$mUno->command(-label => '~Abrir', -command => \&func1);
$mUno->command(-label => '~Guardar', -command => \&func2);
$mUno->command(-label => '~Salir', -command => \&func3);

my $mDos = $menu->cascade(-label => '~Edición', -tearoff => 0);
$mDos->command(-label => '~Borrar texto', -command => \&func4);


my $mTres= $menu->cascade(-label => '~Texto', -tearoff => 0);
$mTres->command(-label => '~Enviar', -command => \&func5);
$mTres->command(-label => '~Histórico enviados', -command => \&func6);


my $mAyuda = $menu->cascade(-label => '~Ayuda', -tearoff => 0);
$mAyuda->command(-label => '~Acerca de...', -command => \&func7);

my $ent = $ventana -> Entry() -> pack();
my $boton = $ventana ->Button(-text=>"resuelve", -command =>\&resuelve);
$boton->pack(-side => 'bottom', -expand => 1, -fill => 'x');
$ventana->Label(-text => "Diccionario")->pack; 
my $dic = $ventana -> Text(-width=>40, -height=>5) -> pack(-side => 'bottom',
-expand => 1, -fill => 'x');
$ventana->Label(-text => "Sinonimo")->pack; 
my $sin = $ventana -> Text(-width=>40, -height=>10) -> pack(-side => 'bottom',
-expand => 1, -fill => 'x');
$ventana->Label(-text => "Tesauro")->pack; 
my $tes = $ventana -> Text(-width=>40, -height=>20) -> pack(-side => 'bottom',
-expand => 1, -fill => 'x');
$ventana->Label(-text => "Texto")->pack; 
my $text = $ventana -> Text(-width=>40, -height=>5) -> pack(-side =>'right',
-expand => 1, -fill => 'x');
MainLoop;

sub func1{
	my @tipos = ( [ "All files ", '*' ] );
	my $nombreFich = $ventana->getOpenFile( -filetypes => \@tipos );
		if ($nombreFich ne "") {
			print "Has elegido $nombreFich \n";
		}
	my $tmp = "Has elegido $nombreFich ";
	$ventana -> messageBox(-type=>"ok", -message=>$tmp);
}
sub func2{
    my @tipos = ( [ "All files ", '*' ] );
	$nombreFich = $ventana->getSaveFile( -filetypes => \@tipos );
		if ($nombreFich ne "") {
			print "Has elegido $nombreFich \n";
		}
	my $tmp = "Has elegido $nombreFich ";
	$ventana -> messageBox(-type=>"ok", -message=>$tmp);

    
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
sub func6{
	$ventana -> messageBox(-type=>"ok", -message=>'Renato Ramirez' . "\n" . 
	'renatolrr@gmail.com' . "\n" .  
	"https://github.com/renatolrr/EjerciciosPerlAvanzado");
}
sub func6{
	$ventana -> messageBox(-type=>"ok", -message=>'Renato Ramirez' . "\n" . 
	'renatolrr@gmail.com' . "\n" .  
	"https://github.com/renatolrr/EjerciciosPerlAvanzado");
}
sub func7{
	$ventana -> messageBox(-type=>"ok", -message=>'Renato Ramirez' . "\n" . 
	'renatolrr@gmail.com' . "\n" .  
	"https://github.com/renatolrr/EjerciciosPerlAvanzado");
}

sub resuelve{
	$temp=$ent->get();
	$palabra = new PA::Moose::Palabra ( palabra => $temp);
	#borra
	$dic->delete('0.0',"end");
	$sin->delete('0.0',"end");
	$tes->delete('0.0',"end");
	
	#resuelve
    $dic ->insert("end", $palabra->diccionario);
    $sin->insert("end", $palabra->sinonimo);
    $tes ->insert("end", $palabra->tesauro);
}
