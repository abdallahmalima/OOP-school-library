class Createable
  def create(items, map)
    raise NotImplementedError, 'You should implement list method in you class'
  end
end

class CreateableBook < Createable
  def create(items, map)
    items.push(Book.new(map[:title], map[:author]))
    puts "\nBook created successfully"
  end
end

class CreateablePerson < Createable
  def create(items, map)
    if map[:type] == 'student'
      student = Student.new('', map[:age], map[:name], map[:parent_permission])
      items.push(student)
    end

    return unless map[:type] == 'teacher'

    teacher = Teacher.new(map[:specialization], map[:age], map[:name])
    items.push(teacher)
  end
end

class CreateableRental
  def create(books, persons, rentals)
    puts 'Select a book from the following list by number'
    ListableBook.new.list(books)
    book_number = gets.chomp
    puts "\n"
    puts 'Select a person from the following list'

    ListablePeople.new.list(persons)
    student_number = gets.chomp
    puts "\n"
    print 'Date:'
    date = gets.chomp

    rentals.push(persons[student_number.to_i].add_rental(date, books[book_number.to_i]))
    puts 'Rental created successfully'
  end
end
