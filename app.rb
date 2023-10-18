require_relative 'classes/book'
require_relative 'classes/person'
require_relative 'classes/student'
require_relative 'classes/rental'
require_relative 'classes/teacher'
require_relative 'classes/people_manager'
require_relative 'classes/book_manager'
require_relative 'classes/rental_manager'

class App
  attr_accessor :people_mgr, :book_mgr, :rental_mgr

  def initialize
    @people_mgr = PeopleManager.new
    @book_mgr = BookManager.new
    @rental_mgr = RentalManager.new
  end

  def display_banner(str)
    padding = (50 - str.length) / 2
    puts ''
    puts '================================================='
    puts "=#{padding}#{str}#{padding}="
    puts '================================================='
    puts ''
  end

  def handle_case(input, app)
    actions = {
      1 => -> { app.book_mgr.list_all_books },
      2 => -> { app.people_mgr.list_all_people },
      3 => -> { app.people_mgr.create_person },
      4 => -> { app.book_mgr.create_book },
      5 => -> { app.rental_mgr.create_rental(app) },
      6 => -> { app.rental_mgr.handle_rental_list(app) },
      7 => -> { exit }
    }

    action = actions[input]

    if action
      action.call
    else
      puts 'Wrong input, please enter again!'
    end
  end
end
