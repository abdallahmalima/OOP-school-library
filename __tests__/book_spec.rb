require 'rspec'
require('./book')
require('./teacher')

describe Book do
  let(:book) { Book.new(1, 'The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:person) { Teacher.new('123', 'Python', '29', 'kennedy') }
  let(:date) { double(:date) }

  describe '#initialize' do
    it 'creates a new book with given title, author and id' do
      expect(book.title).to eq('The Great Gatsby')
      expect(book.author).to eq('F. Scott Fitzgerald')
      expect(book.id).to eq(1)
    end

    it 'creates an empty rentals array' do
      expect(book.rentals).to be_empty
    end
  end

  describe '#add_rental' do
    it 'adds a rental to the rentals array' do
      book.add_rental(date, person)
      expect(book.rentals.size).to eq(1)
    end
  end
end
