#!/usr/bin/env perl

use utf8;
use strict;
use warnings;

use IO::File;

my $wfh = IO::File->new( "foo.txt", "w" );
if ( defined $wfh ) {
  $wfh->print("test");
  $wfh->close();
}
