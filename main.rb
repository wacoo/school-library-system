require_relative('person')
require_relative('student')
require_relative('teacher')

p1 = Person.new('John', 12, false)
puts "Person: #{p1.getName} #{p1.getAge}"

s1 = Student.new('Ruby', 32, false)
puts "Student: #{s1.getName} #{s1.getAge} #{s1.play_hooky}"

t1 = Teacher.new('Tyson', 50, false)
puts "Teacher: #{t1.getName} #{t1.getAge} #{t1.can_use_services}"
