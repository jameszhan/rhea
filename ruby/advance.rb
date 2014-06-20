
`ls -l`.lines.each{|line| p line}

def constant
 return "self=#{self} nil=#{nil} true=#{true} false=#{false} _FILE_=#{__FILE__} _LINE_=#{__LINE__} __id__=#{__id__} __callee__=#{__callee__} __method__=#{__method__}"
end

p constant




p /([^\s@]+)@([^\s ]+)/ =~ "Hello my email is zhiqiangzhan@gmail.com ."

p "Math info: match_string=#{$&} match_info=#{$~} match_left=#{$`} match_right=#{$'} match_group=#{$+}"

p "gets=#{$_} process_status=#{$?} exception=#{$!} exception_pos=#{$@} level=#{$SAFE}"

p "Splits: input=#{$/} output=#{$\} array_join=#{$,} array_split=#{$;}"

p "line_numbers=#{$.} ARGF=#{$<} out=#{$>} ARGV=#{$*}"

p "codeName=#{$0} processId=#{$$}"

p "Require Dirs"
$:.each{|d| p d }

p "Require Files"
$".each{|f| p f}

p $DEBUG
p $FILENAME
p $LOAD_PATH
p $stdin
p $stdout
p $stderr
p $-v
p $VERBOSE
#p $-K


p $LOAD_PATH === $:
