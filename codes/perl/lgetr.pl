#!/usr/bin/perl

use IO::Socket;

my $server = shift;

print "begin to read first line for remote server $server.\n";

my $fh = IO::Socket::INET -> new($server);

my $line = <$fh>;

print $line;