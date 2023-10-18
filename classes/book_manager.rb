class BookManager
  attr_accessor :books

  def initialize
    @books = []
  end

  def list_all_books
    if @books.empty?
      puts 'No book added!'
    else
      puts '================================================='
      puts '=                 LIST OF BOOKS                 ='
      puts '================================================='
      puts ''
      @books.each_with_index { |book, index| puts "  #{index + 1}) Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def create_book
    puts ''
    puts '================================================='
    puts '=                    NEW BOOK                   ='
    puts '================================================='
    puts ''
    print 'Title:> '
    title = gets.chomp
    print 'Author:> '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts ''
    puts 'Book created successfully!'
    puts ''
  end
end
