#!/usr/bin/perl 
# Ficheros en https://github.com/renatolrr/EjerciciosPerlAvanzado 

use YAPE::Regex::Explain;
print YAPE::Regex::Explain->new('\w[a-f]* ')->explain('silent');
