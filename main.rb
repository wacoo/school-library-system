require_relative('classes/person')
require_relative('classes/student')
require_relative('classes/classroom')
require_relative('classes/book')
require_relative('classes/rental')

john = Student.new('Classroom 101', 'John Smith', 16, parent_permission: false)

lily = Student.new('Classroom 101', 'Jane Smith', 26, parent_permission: false)

d6 = Classroom.new('6D')

d6.add_student(john)
d6.add_student(lily)

puts d6.students
puts "#{john.name} #{john.classroom.label}"
puts "#{lily.name} #{lily.classroom.label}"

notw = Book.new('Name of the Wind', 'Patrick Rothfuss')
sla = Book.new('Stormlight Archives', 'Brandon Sanderson')

abebe = Person.new(34, 'Abebe', parent_permission: true)
zeritu = Person.new(50, 'Zeritu', parent_permission: true)

rental1 = Rental.new('2021-09-12', notw, abebe)
rental2 = Rental.new('2022-04-14', sla, abebe)

rental3 = Rental.new('2023-04-03', sla, zeritu)
rental4 = Rental.new('2023-07-02', notw, zeritu)

got = Book.new('Game of thrones', 'Goeorge R.R Martin')

rental5 = Rental.new('2023-08-24', got, abebe)
abebe.add_rental(rental5)
got.add_rental(rental5)

puts "#{rental1.person.name} => #{rental1.book.title}"
puts "#{rental2.person.name} => #{rental2.book.title}"
puts "#{rental3.person.name} => #{rental3.book.title}"
puts "#{rental4.person.name} #{rental4.book.title}"

puts "#{abebe.name} #{abebe.rentals[0].book.title}"
puts "#{got.title} #{got.rentals[0].person.name}"
