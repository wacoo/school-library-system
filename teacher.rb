class Teacher < Person
  def initialize(specialization, age, name = 'Unknown', parent_permission = nil)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services
    true
  end
end
