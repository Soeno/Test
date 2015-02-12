#!/usr/bin/env perl

use utf8;
use strict;
use warnings;

use IO::File;

my $file = "foo.txt";

# write.
my $wfh = IO::File->new( $file, "w" );
if ( defined $wfh ) {
  foreach my $i ( 0 .. 9 ) {
    $wfh->print( "test ", $i, "\n" );
  }
  $wfh->close();
}

# read.
my $rfh = IO::File->new( $file, "r" );
if ( defined $rfh ) {
  while ( my $in = <$rfh> ) {
    print $in;
  }
  undef $rfh;
}
