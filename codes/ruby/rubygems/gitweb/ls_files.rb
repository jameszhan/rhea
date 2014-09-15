require 'rugged'

repo = Rugged::Repository.new("/opt/workdir/ask-ruby/")

puts repo.rev_parse('master').inspect
p Rugged::Branch.each_name(repo).sort

p Rugged::Branch.lookup(repo, 'master')

puts "=========>"

puts repo.rev_parse('i18n').tree.methods.sort

=begin
head = repo.head.target

head_tree = repo.lookup(head).tree

def ls_files(tree)
  puts tree
#  if tree.type == :tree
    tree.each {|item| ls_files(item) } if tree.respond_to?(:each)
#  end
end


#ls_files(head_tree)


head_tree.walk(:postorder) { |root, entry| puts "#{root}#{entry[:name]} [#{entry[:oid]}]" }

head_tree.walk_trees{|root, entry| puts "#{root} => #{entry}"}

head_tree.walk_blobs{|root, entry| puts "#{root} => #{entry}"}
=end


