#!/usr/bin/perl

use IO::File;

my $file = shift;

print "begin to read first line for file $file.\n";
my $fh = IO::File -> new($file);

my $line = <$fh>;

print $line;