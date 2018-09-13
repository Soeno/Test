#!/usr/bin/env perl

use utf8;
use strict;
use warnings;

use Encode::Locale;
use Encode qw( find_encoding );
my $fs = find_encoding('locale_fs');

binmode *STDOUT => ':encoding(console_out)';

my $file = $fs->encode("file.txt");

use IO::File;

# write.
my $wfh = IO::File->new( $file, "w" );
if ( defined $wfh ) {
  binmode $wfh => ':crlf :encoding(cp932)';
  foreach my $i ( 0 .. 9 ) {
    $wfh->print( "test 日本語 ", $i, "\n" );
  }
  $wfh->close();
}

my $co = find_encoding('console_out');

# read.
my $rfh = IO::File->new( $file, "r" );
if ( defined $rfh ) {
  binmode $rfh => ':crlf :encoding(cp932)';
  while ( my $in = <$rfh> ) {
    print $in;
  }
  undef $rfh;
}

# or...
use autodie;
use open IN => ':encoding(cp932)';
open my $rfh2, '<', $file;
while (my $in = <$rfh2>) {
  print $in;
}
close $rfh2;