require './person'
require './classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def add_classroom(classroom)
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
