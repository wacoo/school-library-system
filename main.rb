require_relative('person')
require_relative('student')
require_relative('teacher')
require_relative('decorator')
# p1 = Person.new('John', 12, parent_permission: false)
# puts "Person: #{p1.id} #{p1.name} #{p1.age}"

# s1 = Student.new('Ruby', 32, '6D', parent_permission: false)
# puts "Student: #{s1.id} #{s1.name} #{s1.age} #{s1.play_hooky}"

# t1 = Teacher.new('Tyson', 50, 'Chemistry', parent_permission: false)
# puts "Teacher: #{t1.id} #{t1.name} #{t1.age} #{t1.can_use_services}"

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
