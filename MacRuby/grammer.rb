def location
  return 25, 36
end

x, y = location
p x, y

a, b, c = [1, 2, 3]
p a, b, c

alias loc location

p loc

class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
  end

end

class Books

  def initialize
    @books = []
  end

  def add(book)
    @books << book
  end

  def [](n)
    @books[n]
  end

  def each
    @books.each { |book| yield(book)}
  end

  def each_title(&block)
    @books.each { |book| block.call(book.title)}
  end

end

books = Books.new
[Book.new("abc", "james"), Book.new("def", "zhan")].each { |book| books.add(book) }
books.each_title{|title| p title}

