require('./student')
require('./teacher')
require('./classroom')
require('./book')
require('./rental')


class App
  attr_accessor :books, :persons, :rentals

  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def list_all_books
    if @books.length.eql?(0)
      puts 'There is no books '
    else
      @books.each do |single|
        puts "Title: \"#{single.title}\" , Author: #{single.author}"
      end
    end
  end

  def list_all_people
    if @persons.length.eql?(0)
      puts "\n There is no persons\n"
    else
      @persons.each do |single|
        puts "[#{single.class}] Name: #{single.name},ID: #{single.id}, Age: #{single.age} "
      end
    end
  end

  def create_person(specialization, name, age, parent_permission, type)
    if type == 'student'
      student = Student.new('', age, name, parent_permission)
      @persons.push(student)
    end

    return unless type == 'teacher'

    teacher = Teacher.new(specialization, age, name)
    @persons.push(teacher)
  end

  def create_book(title, author)
    @books.push(Book.new(title, author))
    puts "\nBook created successfully"
  end

  def create_rental
    puts 'Select a book from the following list by number'
    count = 0
    @books.each do |single|
      puts "#{count}) Title: \"#{single.title}\" , Author: #{single.author}"
      count += 1
    end
    book_number = gets.chomp
    puts "\n"
    count = 0
    puts 'Select a person from the following list'
    @persons.each do |single|
      puts "#{count}) [#{single.class}] Name: #{single.name},ID: #{single.id}, Age: #{single.age} "
      count += 1
    end
    student_number = gets.chomp
    puts "\n"
    print 'Date:'
    date = gets.chomp
    @rentals.push(@persons[student_number.to_i].add_rental(date, @books[book_number.to_i]))
    puts 'Rental created successfully'
  end

  def all_rentals_by_person_id(id)
    rentals.each do |single|
      puts single.person.id
      puts "Date: #{single.date},Book \"#{single.book.title}\" by #{single.book.author}" if single.person.id.eql? id
    end
  end
end
