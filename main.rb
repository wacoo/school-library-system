#!/usr/bin/env ruby
require_relative('app')

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
    app.handle_case(input, app)
    puts ''
    puts '**************************************************'
  end
  puts '\n\n'
end

main
