require 'rspec'
require('./person')
require('./teacher')
describe Teacher do
  let(:teacher) { Teacher.new(1, 'Math', 35, 'Jane Doe') }

  it 'inherits from Person' do
    expect(teacher).to be_a(Person)
  end

  it 'has a specialization' do
    expect(teacher.specialization).to eq('Math')
  end

  it 'can use services' do
    expect(teacher.can_use_services?).to eq(true)
  end
end
