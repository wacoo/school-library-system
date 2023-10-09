require_relative('person')
require_relative('student')
require_relative('teacher')

p1 = Person.new('John', 12, false)
puts "Person: #{p1.id} #{p1.name} #{p1.age}"

s1 = Student.new('Ruby', 32, false, '6D')
puts "Student: #{s1.id} #{s1.name} #{s1.age} #{s1.play_hooky}"

t1 = Teacher.new('Tyson', 50, false, 'Chemistry')
puts "Teacher: #{t1.id} #{t1.name} #{t1.age} #{t1.can_use_services}"
