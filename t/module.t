#!perl

use Test2::V0;
use Test2::Tools::Exports;
use Test2::Tools::LoadModule;

use File::Temp;

use Rex::Commands; # for 'set'
use Rex::Commands::File; # for the 'template' function


load_module_ok 'Rex::Template::TT';
imported_ok qw/&template_toolkit/;


# embedded templates use the default engine when our engine isn't registered
is( template( '@hello_template', name => 'world' ), "Hello, world!");
is( template( '@hi_template',    name => 'world' ), "Hi, world!");

my $template;
$template = 'Hello, [% name %]!';
is( template_toolkit( \$template, { name => 'world' } ), 'Hello, world!');
is( template( \$template, { name => 'world' } ), 'Hello, [% name %]!');

{
    my $f = File::Temp->new;
    print $f 'Hello, [% name %]!';
    $f->close;
    is( template_toolkit( $f->filename, { name => 'world' } ), 'Hello, world!');
    is( template( $f->filename, { name => 'world' } ), 'Hello, [% name %]!');
}


done_testing;

# Straight from the docs:

__DATA__
@hello_template
Hello, <%= $name -%>!
@end

@hi_template
Hi, <%= $name -%>!
@end
