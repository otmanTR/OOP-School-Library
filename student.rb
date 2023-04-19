require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name: 'unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def add_classroom(classroom)
    classroom.student.push(self) unless classroom.student.include?(self)
  end
end
