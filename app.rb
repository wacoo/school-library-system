require_relative 'classes/book'
require_relative 'classes/person'
require_relative 'classes/student'
require_relative 'classes/rental'
require_relative 'classes/teacher'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
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

  def list_all_people
    if @people.empty?
      puts 'No people added!'
    else
      puts ''
      puts '================================================='
      puts '=                  LIST OF PEOPLE               ='
      puts '================================================='
      puts ''
      @people.each do |person|
        puts "  [#{person.class.name}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      end
    end
  end

  def prompt_list_rentals
    puts '================================================='
    puts '=                  LIST OF RENTALS              ='
    puts '================================================='
    puts ''
  end

  def list_all_rentals(renter_id = 0)
    puts ''
    if @rentals.empty?
      puts 'No rentals added!'
      return
    end

    if renter_id.zero?
      prompt_list_rentals
      @rentals.each_with_index do |rental, index|
        puts "  #{index + 1}) Date: #{rental.date}, #{rental.book.title} by #{rental.person.name}"
      end
    else
      @rentals.each do |rental|
        if renter_id == rental.person.id
          puts "Date: #{rental.date}, Book title: #{rental.book.title}, Rented by: #{rental.person.name}"
        end
      end
    end
  end

  def prompt_create_person
    puts '================================================='
    puts '=   TYPE A NUMBER TO SELECT A STUDENT/TEACHER   ='
    puts '================================================='
    puts ''
    puts '1) Create a student'
    puts '2) Create a teacher'
    print ':> '
  end

  def user_input_person(input)
    print 'Name:> '
    name = gets.chomp
    print 'Age:> '
    age = gets.chomp
    print 'Has parent permission [Y/N]:> '
    parent_permission = gets.chomp.upcase == 'Y'
    if input == 1
      print 'Classroom:> '
      classroom = gets.chomp
      [name, age, classroom, parent_permission]
    elsif input == 2
      print 'Specialization:> '
      specialization = gets.chomp
      [name, age, specialization, parent_permission]
    end
  end

  def create_person
    prompt_create_person
    input = gets.chomp.to_i
    puts ''
    params = user_input_person(input)
    if input == 1
      student = Student.new(params[2], params[1], params[0], parent_permission: params[3])
      @people << student
    elsif input == 2
      teacher = Teacher.new(params[2], params[1], params[0], parent_permission: params[3])
      @people << teacher
    end
    puts ''
    puts 'Person created successfully!'
    puts ''
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

  def prompt_create_rental
    puts ''
    print 'SELECT BOOK TO RENT:> '
    book_idx = gets.chomp.to_i
    person_instances = list_all_people

    print 'SELECT RENTER[ID]:> '
    renter_id = gets.chomp.to_i
    print 'Date:> '
    date = gets.chomp
    [person_instances, book_idx, renter_id, date]
  end

  def create_rental
    book_instances = list_all_books
    params = prompt_create_rental
    puts ''
    selected_book = book_instances[params[1] - 1]
    selected_person = params[0].find { |person| params[2] == person.id }
    rental = Rental.new(params[3], selected_book, selected_person)
    @rentals << rental
    puts ''
    puts 'Rental created successfully!'
    puts ''
  end

  def handle_rental_list
    puts ''
    list_all_people
    puts ''
    print 'TYPE RENTER ID:> '
    id = gets.chomp.to_i
    list_all_rentals(id)
  end

  def handle_wrong_input
    puts 'Wrong input, please enter again!'
  end
end
