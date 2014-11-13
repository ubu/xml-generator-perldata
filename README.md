XML::Generator::PerlData
========================

XML::Generator::PerlData provides a simple way to generate SAX2 events
from nested Perl data structures, while providing finer-grained control
over the resulting document streams.

### Installation ###

    cpanm XML::Generator::PerlData


### Usage ###

```perl
  use XML::SAX::Writer; # or any other SAX2 Handler or Filter
  use XML::Generator::PerlData;

  ## Simple style ##

  # get a deeply nested Perl data structure...
  my $hash_ref = $obj->getScaryNestedDataStructure();

  # create an instance of a handler class to forward events to...
  my $handler = SomeSAX2HandlerOrFilter->new();

  # create an instance of the PerlData driver...
  my $driver  = XML::Generator::PerlData->new( Handler => $handler );

  # generate XML from the data structure...
  $driver->parse( $hash_ref );


  ## Or, Stream style ##

  use XML::Generator::PerlData;
  use SomeSAX2HandlerOrFilter;

  # create an instance of a handler class to forward events to...
  my $handler = SomeSAX2HandlerOrFilter->new();

  # create an instance of the PerlData driver...
  my $driver  = XML::Generator::PerlData->new( Handler => $handler );

  # start the event stream...
  $driver->parse_start();

  # pass the data through in chunks
  # (from a database handle here)
  while ( my $array_ref = $dbd_sth->fetchrow_arrayref ) {
      $driver->parse_chunk( $array_ref );
  }

  # end the event stream...
  $driver->parse_end();
```

For more information, please visit [https://metacpan.org/pod/XML::Generator::PerlData]
or type ```perldoc XML::Generator::PerlData``` on your terminal after installing.

### Author ###

Kip Hampton, khampton@totalcinema.com

### Copyright & License ###

(c) Kip Hampton, 2002-2014, All Rights Reserved.

This module is released under the Perl Artistic Licence and
may be redistributed under the same terms as perl itself.

