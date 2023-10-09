require('securerandom')
class Person
  def initialize(name = 'Unknown', age = nil, parent_permission = true)
    @id = SecureRandom.uuid
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def getId
    @getId
  end

  def getName
    @name
  end

  def setName(name)
    @name = name
  end

  def getAge
    @age
  end

  def setAge(age)
    @age = age
  end

  def can_use_services
    if of_age() || @parent_permission
      return true
    else
      return false
    end
  end

  private

  def of_age()
    if @age >= 18
      return true
    else
      return false
    end
  end
end
