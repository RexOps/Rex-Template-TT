# NAME

Rex::Template::TT - A module to process templates with template toolkit.

# VERSION

version 1.0.0

# SYNOPSIS

    use Rex::Template::TT;

    task "blah", sub {
      file "/tmp/blah",
           content    => template("path/to/blah.template",
                                          { persons => ['bob', 'alice'] }),
           owner     => "root",
           group     => "root",
           mode      => 644
    };

    # to use as a default template engine
    # this will make the template() function use TemplateTookit to render
    # all the templates. This will also register all the known template variables
    # like hostname, eth0_ip and so on.
    use Rex::Ext::TemplateTookkit ':register';

# DESCRIPTION

A Rex extension module to process templates with template toolkit.

# AUTHORS

This module in its current publication is written by Nicolas Leclerq, based
on prior work by Jan Gehring. The original version by Nicolas was published
through the now-defunct _Rex Recipes_. Since Nicolas's version ended up
being more feature-rich than Jan's, Jan gave permission to overwrite his
version with Nicolas's.

- Nicolas Leclercq <nicolas.private@gmail.com>
- Jan Gehring <krimdomu@googlemail.com>

# CONTRIBUTORS

- Erik Huelsmann <ehuels@gmail.com>

# SEE ALSO

- [Template](https://metacpan.org/pod/Template)
- [Rex](https://metacpan.org/pod/Rex)
- [http://www.template-toolkit.org/](http://www.template-toolkit.org/)

# LICENSE

The Apache License, Version 2.0, January 2004
