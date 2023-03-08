require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, parent_permission: true, name: 'Unkown', classroom: nil)
    super(age, name, parent_permission)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
