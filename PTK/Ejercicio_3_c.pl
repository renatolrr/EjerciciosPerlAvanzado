#!/usr/bin/perl

# Los ejercicios están en https://github.com/renatolrr/EjerciciosPerlAvanzado

use Tk;
use utf8; #problema acentos

my $ventana = new MainWindow;
$ventana->title('Ejemplo de Menu');
$ventana->geometry("300x200"); # damos el tamaño en anchura y altura
$ventana->resizable( 0, 0 ); #  no dejaremos que la redimensionen

my $menu = $ventana->Menu(-type => 'menubar');
$ventana->configure(-menu => $menu);

my $mUno = $menu->cascade(-label => '~Archivo', -tearoff => 0);
$mUno->command(-label => '~Crear archivo', -command => \&func1);
$mUno->command(-label => '~Salir', -command => \&func2);

my $mDos = $menu->cascade(-label => '~Edición', -tearoff => 0);
$mDos->command(-label => '~Borrar texto', -command => \&func3);
$mDos->command(-label => '~Rellenar con AAA', -command => \&func4);

my $mAyuda = $menu->cascade(-label => '~Ayuda', -tearoff => 0);
$mAyuda->command(-label => '~Acerca de...', -command => \&func5);

my $ent = $ventana -> Text(-width=>40, -height=>10) -> pack();

MainLoop;

sub func1{
         #$ventana -> messageBox(-type=>"ok", -message=>"Has elegido Crear archivo");
         my $tmp = $ent->get('0.0','end');
         open (f1,">>fichero.txt");
         print f1 $tmp . "\n"; 
         close (f1);
}
sub func2{
         #$ventana -> messageBox(-type=>"ok", -message=>"Has elegido Salir");
         exit();
}
sub func3{
         #$ventana -> messageBox(-type=>"ok", -message=>"Has elegido Borrar texto");
         $ent->delete('0.0',"end");
}
sub func4{
         #$ventana -> messageBox(-type=>"ok", -message=>"Has elegido Rellenar con AAA");
         $ent->insert("end", "AAA");
}
sub func5{
         $ventana -> messageBox(-type=>"ok", -message=>'Renato Ramirez' . "\n" . 'renatolrr@gmail.com');
}
