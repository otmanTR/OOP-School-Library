require './person'
require './classroom'

class Student < Person
  attr_reader :classroom

  def initialize(age:, classroom:, parent_permission:, name: 'unknown')
    super(age: age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def add_classroom(classroom)
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
