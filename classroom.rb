require_relative 'student'

class Classroom
    attr_accessor :label
    attr_reader :students
  
    def initialize(label)
      @label = label
      @students = []
    end
  
  
    def add_student(student)
      @students << student
      student.classroom = self
    end
  end

#    classroom = Classroom.new("form-one-A");
#    student_1=Student.new(
#     classroom:classroom,
#     age:27,
#     name:"juma",
#     )
#     student_2=Student.new(
#         classroom:classroom,
#         age:29,
#         name:"mimi",
#         );
#   classroom.add_student(student_1)
#   classroom.add_student(student_2)

#     print classroom.students
#     puts ""
#     puts ""
#     puts ""
#     print student_2.classroom.students
