require 'json'

class Createable
  def create(map)
    raise NotImplementedError, 'You should implement list method in you class'
  end
end

class CreateableBook < Createable
  def create(map)
    book = {
      'id' => Random.rand(1...1000),
      'title' => map[:title],
      'author' => map[:author]
    }
    save_book(book)
    puts "\nBook created successfully"
  end

  def save_book(book)
    file = File.open('books.json', 'r')
    data = file.read
    parsed_data = JSON.parse(data)

    parsed_data << book

    File.write('books.json', JSON.pretty_generate(parsed_data))
  end
end

class CreateablePerson < Createable
  def create(map)
    if map[:type] == 'student'
      student = {
        'type' => map[:type],
        'id' => Random.rand(1...1000),
        'name' => map[:name],
        'age' => map[:age],
        'parent_permission' => map[:parent_permission]
      }
      save_person(student)
    end
    return unless map[:type] == 'teacher'

    teacher = {
      type: map[:type],
      'id' => Random.rand(1...1000),
      'name' => map[:name],
      'age' => map[:age],
      'specialization' => map[:specialization]
    }

    save_person(teacher)
  end

  def save_person(person)
    file = File.open('people.json', 'r')
    data = file.read
    parsed_data = JSON.parse(data)

    parsed_data << person

    File.write('people.json', JSON.pretty_generate(parsed_data))
  end
end

class CreateableRental
  def create
    books = ListableBook.new.books_data
    persons = ListablePeople.new.persons

    book_number = show_books
    puts "\n"

    student_number = show_people
    puts "\n"

    print 'Date:'
    date = gets.chomp

    new_rental = persons[student_number.to_i].add_rental(date, books[book_number.to_i])
    person_data = {}
    person_data = get_student_data(new_rental) if new_rental.person.class.to_s == 'Student'

    person_data = get_teacher_data(new_rental) if new_rental.person.class.to_s == 'Teacher'

    rental = get_rental_data(new_rental, person_data)

    save_rental_data(rental)

    puts 'Rental created successfully'
  end

  def show_books
    puts 'Select a book from the following list by number'
    ListableBook.new.list
    gets.chomp
  end

  def show_people
    puts 'Select a person from the following list'
    ListablePeople.new.list
    gets.chomp
  end

  def get_student_data(new_rental)
    {
      type: 'student',
      id: new_rental.person.id,
      name: new_rental.person.name,
      age: new_rental.person.age,
      parent_permission: new_rental.person.parent_permission
    }
  end

  def get_teacher_data(new_rental)
    {
      type: 'teacher',
      id: new_rental.person.id,
      name: new_rental.person.name,
      age: new_rental.person.age,
      specialization: new_rental.person.specialization
    }
  end

  def save_rental_data(rental)
    file = File.open('rentals.json', 'r')
    data = file.read
    parsed_data = JSON.parse(data)

    parsed_data << rental

    File.write('rentals.json', JSON.pretty_generate(parsed_data))
  end

  def get_rental_data(new_rental, person_data)
    {
      'date' => new_rental.date,
      'book' => {
        id: new_rental.book.id,
        title: new_rental.book.title,
        author: new_rental.book.author
      },
      'person' => person_data
    }
  end
end
