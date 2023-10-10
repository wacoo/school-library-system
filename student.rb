class Student < Person
  def initialize(classroom, age, name = 'Unknown', parent_permission = nil)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
