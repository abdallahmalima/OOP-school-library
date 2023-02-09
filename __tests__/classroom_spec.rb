require 'rspec'
require('./student')
require('./classroom')
describe Classroom do
  let(:classroom) { Classroom.new('Class A') }
  let(:student) { Student.new(1, nil, 18, 'John Doe', true) }

  it 'has a label' do
    expect(classroom.label).to eq('Class A')
  end

  it 'can change its label' do
    classroom.label = 'Class B'
    expect(classroom.label).to eq('Class B')
  end

  it 'has an array of students' do
    expect(classroom.students).to eq([])
  end

  it 'can add a student to the classroom' do
    expect(student.classroom).to be_nil
    classroom.add_student(student)
    expect(classroom.students).to include(student)
    expect(student.classroom).to eq(classroom)
  end
end
