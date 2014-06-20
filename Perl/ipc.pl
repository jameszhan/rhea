#!/usr/bin/perl

$child = fork();
die "Can't fork: $!" unless defined $child;

$parent = getppid();

if($child > 0){# it's parent process.
	print "fork a new process with id $child and its parent id is $parent, current id $$\n";
}else{# it's child process.
	print "Here is child process. and its parent id is $parent, current id $$\n";
	exec ('ls', '-l');
	die "exec error (): $!"; #shouldn't get here.
}
