use strict;
use warnings;

use Proyecto;

my $app = Proyecto->apply_default_middlewares(Proyecto->psgi_app);
$app;

