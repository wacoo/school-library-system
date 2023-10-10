require_relative('nameable')

class Decorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    @nameable = nameable
    super()
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    str = @nameable.correct_name
    str.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    str = @nameable.correct_name
    str.slice(0, 10)
  end
end
