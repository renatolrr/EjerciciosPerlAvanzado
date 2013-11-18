#!/usr/bin/perl
use Tk;

use Tk::Canvas::GradientColor;
  
  my $ventana = MainWindow->new(
    -title      => 'Tk::Canvas::GradientColor',
    -background => 'white',
  );
  
  my $canvas = $ventana->GradientColor(
    -width  => 200,
    -height => 300,
  )->pack(qw/ -fill both -expand 1 /);
  
  my $sol = $canvas -> createOval(10,10,50,50, -fill=>"yellow"); #sol
  my $arbol = $canvas -> createOval(10,100,50,150, -fill=>"green"); #arbol copa
  my $tronco = $canvas -> createRectangle(25,150,35,200, -fill=>"brown");#tronco
  my $techo = $canvas -> createPolygon(150,100,225,5,300,100,150,100, -fill=>"red");#techo
  my $casa = $canvas -> createRectangle(150,100,300,250, -fill=>"white", -width=>0);#casa
  my $puerta = $canvas -> createRectangle(200,150,250,250, -fill=>"black", -width=>0);#puerta
  
  $ventana>update;
  sleep 3;
  
  # Change color
  $canvas->set_gradientcolor(
    -start_color => '#00CDFF',
    -end_color   => '#F4A460',
  );
  
  

  
  $ventana->update;
  sleep 3;
  
  # Change type
  $canvas->set_gradientcolor(
    -start       => 50,
    -end         => 100,
    -type        => 'linear_vertical'
  );


$canvas -> pack();

MainLoop;
