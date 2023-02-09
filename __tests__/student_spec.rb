require 'rspec'
require('./person')
require('./student')
describe Student do
  let(:student) { Student.new(1, 'Class A', 18, 'John Doe', true) }

  it 'inherits from Person' do
    expect(student).to be_a(Person)
  end

  it 'has a classroom' do
    expect(student.classroom).to eq('Class A')
  end

  it 'can change its classroom' do
    student.classroom = 'Class B'
    expect(student.classroom).to eq('Class B')
  end

  it 'can add itself to a classroom' do
    classroom = double('classroom')
    allow(classroom).to receive(:students).and_return([])
    expect(classroom.students).to_not include(student)
    student.add_to_classroom(classroom)
    expect(classroom.students).to include(student)
  end

  it 'returns a string when playing hooky' do
    expect(student.play_hooky).to eq('¯(ツ)/¯')
  end
end
