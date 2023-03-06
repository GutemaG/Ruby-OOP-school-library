class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    true if @age >= 18 || @parent_permission
    false
  end

  private

  def is_of_age?
    @age >= 18
  end
end
