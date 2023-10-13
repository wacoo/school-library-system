#!/usr/bin/env ruby
require_relative('classes/book')
require_relative('classes/person')
require_relative('classes/student')
require_relative('classes/rental')
require_relative('classes/teacher')

def list_all_books()
  book_instances = ObjectSpace.each_object(Book).to_a
  if book_instances.empty?
    puts 'No book added!'
    return
  end
  puts '================================================='
  puts '=                 LIST OF BOOKS                 ='
  puts '================================================='
  puts ''
  book_instances.each_with_index do |book, index|
    puts "  #{index + 1}) Title: #{book.title}, Author: #{book.author}"
  end
end

def list_all_people
  person_instances = ObjectSpace.each_object(Person).to_a
  if person_instances.empty?
    puts 'No people added!'
    return
  end
  puts ''
  puts '================================================='
  puts '=                  LIST OF PEOPLE               ='
  puts '================================================='
  puts ''
  person_instances.each do |person|
    puts "  [#{person.class.name}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
  end
  person_instances
end

def prompt_list_rentals
  puts '================================================='
  puts '=                  LIST OF RENTALS              ='
  puts '================================================='
  puts ''
end

def list_all_rentals(renter_id = 0)
  rental_instances = ObjectSpace.each_object(Rental).to_a
  if rental_instances.empty?
    puts 'No rentals added!'
    return
  end
  if renter_id.zero?
    prompt_list_rentals
    rental_instances.each_with_index do |rental, index|
      puts "  #{index + 1}) Date: #{rental.date}, #{rental.book.title} by #{rental.person.name}"
    end
  else
    rental_instances.each do |rental|
      if renter_id == rental.person.id
        puts "Date: #{rental.date}, Book title: #{rental.book.title}, Rented by: #{rental.person.name}"
      end
    end
  end
end

def prompt_create_person
  puts ''
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
  parent_permission = gets.chomp
  permission = false
  permission = true if parent_permission.upcase == 'Y'
  if input == 1
    print 'Classroom:> '
    classroom = gets.chomp
    [name, age, classroom, permission]
  elsif input == 2
    print 'Specialization:> '
    specialization = gets.chomp
    [name, age, specialization, permission]
  end
end

def create_person
  prompt_create_person
  input = gets.chomp.to_i
  puts ''
  params = user_input_person(input)
  if input == 1
    Student.new(params[2], params[1], params[0], parent_permission: params[3])
  elsif input == 2
    Teacher.new(params[2], params[1], params[0], parent_permission: params[3])
  end
  list_all_people
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
  Book.new(title, author)
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
  selected_book = nil
  selected_person = nil
  book_instances.each_with_index do |book, index|
    selected_book = book if (params[1] - 1) == index
  end

  params[0].each_with_index do |person, _index|
    selected_person = person if params[2] == person.id
  end
  Rental.new(params[3], selected_book, selected_person)
  puts ''
  puts 'Rental created successfully!'
  puts ''
end

def handle_case(input)
  actions = {
    1 => method(:list_all_books),
    2 => method(:list_all_people),
    3 => method(:create_person),
    4 => method(:create_book),
    5 => method(:create_rental),
    6 => method(:handle_rental_list),
    7 => method(:exit)
  }

  action = actions[input]
  action ? action.call : handle_wrong_input
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

def main
  loop do
    puts ''
    puts '=================================================='
    puts '=   PLEASE CHOOSE AN OPTION BY TYPING A NUMBER   ='
    puts '=================================================='
    puts ''
    puts '  1 - List of all books'
    puts '  2 - List of all people'
    puts '  3 - Create a person'
    puts '  4 - Create a book'
    puts '  5 - Create a rental'
    puts '  6 - List od all rentals for a given id'
    puts '  7 - Exit'
    print '  :> '
    input = gets.chomp.to_i
    handle_case(input)
    puts ''
    puts '**************************************************'
  end
  puts '\n\n'
end
main
