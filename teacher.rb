require './person'

class Teacher < Person
  def initialize(age, parent_permission: true, name: 'Unkown', specialization: nil)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
