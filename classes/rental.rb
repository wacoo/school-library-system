class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @person = person
    @book = book
  end

  def add_rental(date, person)
    Rental.new(date, book, person)
    book.rentals << self
    person.rentals << self
  end
end
