#!/usr/bin/perl
use strict;
use warnings;
use Tk;

my $ventana = MainWindow->new();
$ventana->minsize(qw(200 100));
$ventana->title("Tabla enteros");



my $f1 = $ventana->Label(-text => " 1 ");
my $f2 = $ventana->Label(-text => " 2 ");
my $c1 = $ventana->Label(-text => " A ");
my $c2 = $ventana->Label(-text => " B ");
my $a1 = $ventana->Entry(-width => 20, -background => 'white');
my $a2 = $ventana->Entry(-width => 20, -background => 'white');
my $b1 = $ventana->Entry(-width => 20, -background => 'white');
my $b2 = $ventana->Entry(-width => 20, -background => 'white');
my $boton1 = $ventana->Button(-text => "Sumar", -relief => 'raised', -width => 15, -command => \&funcionSumar );

$f1->grid(-row=>2,-column=>1);
$f2->grid(-row=>3,-column=>1);
$c1->grid(-row=>1,-column=>2);
$c2->grid(-row=>1,-column=>3);
$a1->grid(-row=>2,-column=>2);
$a2->grid(-row=>3,-column=>2);
$b1->grid(-row=>2,-column=>3);
$b2->grid(-row=>3,-column=>3);
$boton1->grid(-row=>4,-column=>3);



MainLoop();


sub funcionSumar {
	my $total = int($a1->get())+int($a2->get())+ int($b1->get())+int($b2->get());
	
	my $texto_en_messageBox ="El total es: \n $total ";
	my $dialogo = $ventana->messageBox(-title => "Suma", -message => $texto_en_messageBox, -icon => 'warning', -type => 'Ok');
}
