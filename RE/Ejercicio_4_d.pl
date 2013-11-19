#!/usr/bin/perl 
# Ficheros en https://github.com/renatolrr/EjerciciosPerlAvanzado 

$_="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ut dolor in mi adipiscing consequat id at quam.";
m/
    (\w+)      (?# Busca una palabra y la guarda en el patron de memoria)
    [.!?]?     (?# Trata el punto final, la exclamación y la interrogación)
    \s*        (?# Trata el caracter de espaciado)
    $          (?# Debe  de coincidir al final de la cadena)
/x;
print "$1 \n"

