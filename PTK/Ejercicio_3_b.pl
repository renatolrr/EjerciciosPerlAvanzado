#!/usr/local/bin/perl

# Los ejercicios están en https://github.com/renatolrr/EjerciciosPerlAvanzado
use Tk;

my $ventana = new MainWindow;

$ventana->Label(-text => "Nombre:")->pack();
my $nombre = $ventana -> Entry() -> pack();
$ventana->Label(-text => "Apellidos:")->pack();
my $apellido = $ventana -> Entry() -> pack();
$ventana->Label(-text => "Email:")->pack();
my $email = $ventana -> Entry() -> pack();


my $boton = $ventana -> Button(-text => "Graba", 
                -command =>\&pinchar);
$boton -> pack();

MainLoop;

# func. ejecutada al pulsar el botón
sub pinchar {
	my $nom = $nombre->get();
	my $ape = $apellido->get();
	my $ema = $email->get();
	my $tmp = "Nombre: " . $nom . " Apellidos: ". $ape . " Email: " . $ema ;
    $ventana -> messageBox(-type=>"ok", -message=>$tmp);
    open (alumno,">>alumno.txt");
    print alumno $nom . ";" . $ape . ";" . $ema . "\n"; 
    close (alumno); 
}
