require 'rspec'
require('./student')
require('./teacher')
require('./classroom')
require('./book')
require('./rental')
require('./listable')
require('./creatable')
describe Nameable do
  describe '#correct_name' do
    it 'raises a NotImplementedError' do
      nameable = Nameable.new
      expect { nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end

describe Person do
  let(:person) { Person.new(1, 18, 'John Doe') }
  let(:book) { Book.new(1, 'The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:date) { double(:date) }

  describe '#initialize' do
    it 'creates a new person with given name, age, id, and parent_permission' do
      expect(person.name).to eq('John Doe')
      expect(person.age).to eq(18)
      expect(person.id).to eq(1)
      expect(person.parent_permission).to be true
    end

    it 'creates an empty rentals array' do
      expect(person.rentals).to be_empty
    end
  end

  describe '#add_rental' do
    it 'adds a rental to the rentals array' do
      person.add_rental(date, book)
      expect(person.rentals.size).to eq(1)
    end
  end

  describe '#can_use_services?' do
    context 'when the person is of age' do
      it 'returns true' do
        expect(person.can_use_services?).to be true
      end
    end

    context 'when the person is not of age and has parent permission' do
      let(:person) { Person.new(1, 17, 'Jane Doe') }

      it 'returns true' do
        expect(person.can_use_services?).to be true
      end
    end

    context 'when the person is not of age and does not have parent permission' do
      let(:person) { Person.new(1, 17, 'Jane Doe', false) }

      it 'returns false' do
        expect(person.can_use_services?).to be false
      end
    end
  end

  describe '#correct_name' do
    it 'returns the name' do
      expect(person.correct_name).to eq('John Doe')
    end
  end
end

describe Decorator do
  let(:nameable) { double(:nameable, correct_name: 'test') }
  let(:decorator) { Decorator.new(nameable) }

  describe '#initialize' do
    it 'takes a Nameable object as an argument' do
      expect(decorator.instance_variable_get(:@nameable)).to eq(nameable)
    end
  end

  describe '#correct_name' do
    it 'returns the correct_name from the Nameable object' do
      expect(decorator.correct_name).to eq('test')
    end
  end

  describe CapitalizeDecorator do
    let(:nameable) { double('Nameable', correct_name: 'john') }
    let(:capitalize_decorator) { CapitalizeDecorator.new(nameable) }

    describe '#correct_name' do
      it 'should capitalize the name returned by the nameable object' do
        expect(capitalize_decorator.correct_name).to eq 'John'
      end
    end
  end

  describe TrimmerDecorator do
    let(:nameable) { double('Nameable', correct_name: 'John Doe') }
    let(:trimmer_decorator) { TrimmerDecorator.new(nameable) }

    describe '#correct_name' do
      it 'should trim the name returned by the nameable object to 10 characters' do
        expect(trimmer_decorator.correct_name).to eq 'John Doe'[0..9]
      end
    end
  end
end
