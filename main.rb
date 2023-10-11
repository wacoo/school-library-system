require_relative('classes/person')
require_relative('classes/student')
require_relative('classes/classroom')

john = Student.new ('John', 20)

lily = Student.new ('Lily', 25)

6d = Classroom.new('6D')
#6B = Classroom.new('6B')

6d.add_student(john)
6d.add_student(lily)

puts 6d.students
puts john.classroom
puts lily.classroom

