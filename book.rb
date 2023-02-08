class Book
  attr_accessor :title, :author
  attr_reader :rentals, :id

  def initialize(id, title, author)
    @title = title
    @author = author
    @id = id
    @rentals = []
  end

  def add_rental(date, person)
    @rentals << Rental.new(date, self, person)
  end
end
