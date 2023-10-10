require('securerandom')
class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission = nil)
    @id = SecureRandom.uuid
    @name = name
    @age = age
    @parent_permission = parent_permission.nil? ? true : parent_permission
  end

  def can_use_services
    return true if of_age || @parent_permission

    false
  end

  private

  def of_age()
    return true if @age >= 18

    false
  end
end
