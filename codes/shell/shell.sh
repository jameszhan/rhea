#!/bin/sh

echo "pid:  $$"
echo "lastpid: $!"
echo "lastcode: $?"
echo "flag: $-"

echo "args count: $#"
echo "scname: $0"
echo "first:  $1"
echo "second: $2"
echo "arguments: $@"
echo "arguments: $*"
