require './person'

class Student < Person
  def initialize(age, parent_permission: true, name: 'Unkown', classroom: nil)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
