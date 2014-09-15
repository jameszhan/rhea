require 'rugged'

repo = Rugged::Repository.new("/opt/workdir/ask-ruby/")

puts repo.methods

puts repo.rev_parse('master').tree.inspect
