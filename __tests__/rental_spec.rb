require 'rspec'
require('./book')
require('./person')
require('./rental')
describe Rental do
  let(:book) { Book.new(1, 'The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:person) { Person.new(1, 25, 'Jane Doe', true) }
  let(:rental) { Rental.new('2022-01-01', book, person) }

  it 'has a date' do
    expect(rental.date).to eq('2022-01-01')
  end

  it 'can change its date' do
    rental.date = '2022-02-01'
    expect(rental.date).to eq('2022-02-01')
  end

  it 'has a book' do
    expect(rental.book).to eq(book)
  end

  it 'has a person' do
    expect(rental.person).to eq(person)
  end
end
