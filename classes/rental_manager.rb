class RentalManager
  attr_accessor :rentals

  def initialize
    @rentals = []
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

  def prompt_create_rental(app)
    puts ''
    print 'SELECT BOOK TO RENT:> '
    book_idx = gets.chomp.to_i
    person_instances = app.people_mgr.list_all_people

    print 'SELECT RENTER[ID]:> '
    renter_id = gets.chomp.to_i
    print 'Date:> '
    date = gets.chomp
    [person_instances, book_idx, renter_id, date]
  end

  def create_rental(app)
    book_instances = app.book_mgr.list_all_books
    params = prompt_create_rental(app)
    puts ''
    selected_book = book_instances[params[1] - 1]
    selected_person = params[0].find { |person| params[2] == person.id }
    rental = Rental.new(params[3], selected_book, selected_person)
    @rentals << rental
    puts ''
    puts 'Rental created successfully!'
    puts ''
  end

  def handle_rental_list(app)
    puts ''
    app.people_mgr.list_all_people
    puts ''
    print 'TYPE RENTER ID:> '
    id = gets.chomp.to_i
    list_all_rentals(id)
  end
end
