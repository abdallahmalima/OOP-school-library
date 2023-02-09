class Listable
  def list
    raise NotImplementedError, 'You should implement list method in you class'
  end
end

class ListableBook < Listable
  attr_reader :books_data

  def initialize
    super()
    @books_data = []
    fetch_books
  end

  def fetch_books
    file = File.open('books.json', 'r')
    data = file.read
    parsed_data = JSON.parse(data)

    parsed_data.each do |obj|
      @books_data.push(
        Book.new(obj['id'], obj['title'], obj['author'])
      )
    end
  end

  def list
    if @books_data.length.eql?(0)
      puts 'There is no books '
    else
      count = 0
      @books_data.each do |single|
        puts "#{count}) Title: \"#{single.title}\" , Author: #{single.author}"
        count += 1
      end
    end
  end
end

class ListablePeople < Listable
  attr_reader :persons

  def initialize
    super()
    @persons = []
    fetch_people
  end

  def fetch_people
    file = File.open('people.json', 'r')
    data = file.read
    parsed_data = JSON.parse(data)

    parsed_data.each do |obj|
      unless obj['type'] == 'student'
        @persons.push(Teacher.new(obj['id'], obj['specialization'], obj['age'],
                                  obj['name']))
      end
      unless obj['type'] == 'teacher'
        @persons.push(Student.new(obj['id'], obj['age'], obj['name'],
                                  obj['parent_permission']))
      end
    end
  end

  def list()
    if @persons.length.eql?(0)
      puts "\n There are no people\n"
    else
      count = 0
      @persons.each do |single|
        puts "#{count}) [#{single.class}] Name: #{single.name}, ID: #{single.id}, Age: #{single.age} "
        count += 1
      end
    end
  end
end

class ListableRental
  def initialize
    @rental_list = []
    fetch_rentals
  end

  def fetch_rentals
    file = File.open('rentals.json', 'r')
    data = file.read
    parsed_data = JSON.parse(data)

    parsed_data.each do |obj|
      new_book = Book.new(obj['book']['id'], obj['book']['title'], obj['book']['author'])
      new_person = nil
      if obj['person']['type'] == 'teacher'
        new_person = Teacher.new(obj['person']['id'], obj['person']['specialization'], obj['person']['age'],
                                 obj['person']['name'])
      end
      if obj['person']['type'] == 'student'
        new_person = Student.new(obj['person']['id'], ' ', obj['person']['age'], obj['person']['name'],
                                 obj['person']['parent_permission'])
      end
      @rental_list.push(
        Rental.new(obj['date'], new_book, new_person)
      )
    end
  end

  def list(id)
    @rental_list.each do |single|
      puts single.person.id
      puts "Date: #{single.date},Book \"#{single.book.title}\" by #{single.book.author}" if single.person.id.eql? id
    end
  end
end
