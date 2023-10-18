class PeopleManager
  attr_accessor :people

  def initialize
    @people = []
  end

  def list_all_people
    if @people.empty?
      puts 'No people added!'
    else
      puts ''
      puts '================================================='
      puts '=                  LIST OF PEOPLE               ='
      puts '================================================='
      puts ''
      @people.each do |person|
        puts "  [#{person.class.name}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      end
    end
  end

  def prompt_create_person
    puts '================================================='
    puts '=   TYPE A NUMBER TO SELECT A STUDENT/TEACHER   ='
    puts '================================================='
    puts ''
    puts '1) Create a student'
    puts '2) Create a teacher'
    print ':> '
  end

  def user_input_person(input)
    print 'Name:> '
    name = gets.chomp
    print 'Age:> '
    age = gets.chomp
    print 'Has parent permission [Y/N]:> '
    parent_permission = gets.chomp.upcase == 'Y'
    if input == 1
      print 'Classroom:> '
      classroom = gets.chomp
      [name, age, classroom, parent_permission]
    elsif input == 2
      print 'Specialization:> '
      specialization = gets.chomp
      [name, age, specialization, parent_permission]
    end
  end

  def create_person
    prompt_create_person
    input = gets.chomp.to_i
    puts ''
    params = user_input_person(input)
    if input == 1
      student = Student.new(params[2], params[1], params[0], parent_permission: params[3])
      @people << student
    elsif input == 2
      teacher = Teacher.new(params[2], params[1], params[0], parent_permission: params[3])
      @people << teacher
    end
    puts ''
    puts 'Person created successfully!'
    puts ''
  end
end
