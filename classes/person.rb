require('securerandom')
require_relative('nameable')
require_relative('rental')

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = SecureRandom.random_number(9000) + 1000
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  def can_use_services
    return true if of_age || @parent_permission

    false
  end

  def correct_name
    @name
  end

  private

  def of_age()
    return true if @age >= 18

    false
  end
end
