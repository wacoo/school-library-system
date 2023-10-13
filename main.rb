#!/usr/bin/env ruby
require_relative('app')

def self.handle_case(input, app)
  actions = {
    1 => app.method(:list_all_books),
    2 => app.method(:list_all_people),
    3 => app.method(:create_person),
    4 => app.method(:create_book),
    5 => app.method(:create_rental),
    6 => app.method(:handle_rental_list),
    7 => app.method(:exit)
  }
  action = actions[input]
  action ? action.call : handle_wrong_input
end

def main
  app = App.new
  loop do
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
    handle_case(input, app)
    puts ''
    puts '**************************************************'
  end
  puts '\n\n'
end

main
