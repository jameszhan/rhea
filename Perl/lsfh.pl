#!/usr/bin/perl

open(LSFH, "ls -l |") or die "Can't open ls -l: $!";

while(my $line = <LSFH>){
	print("I saw: $line\n");
}

close LSFH;