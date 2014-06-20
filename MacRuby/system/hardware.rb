`system_profiler | grep  --color Processor`.lines{|line| puts line}

`sysctl -a | grep cpu`.lines{|line| puts line}

`ps auxw`.lines{|line| puts line}

`df -h`.lines{|line| puts line}