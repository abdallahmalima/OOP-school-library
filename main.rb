require('./app')

# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
def main
  app = App.new
  puts "\nWelcome to School Library App!\n"
  inputs =
    "\nPlease choose an option by enterin a number:\n" \
    "1 - list all books\n" \
    "2 - list all people\n" \
    "3 - Create a person\n" \
    "4 - Create a book\n" \
    "5 - Create a rental\n" \
    "6 - list all rentals for a given person id\n" \
    "7 - Exit\n"
  flag = true
  while flag
    puts inputs
    choice = gets.chomp
    case choice
    when '1'
      app.list_all_books
    when '2'
      app.list_all_people
    when '3'
      print 'Do you want to create a student (1) or a teacher (2)?[Input the number]:'
      sub_choice = gets.chomp
      case sub_choice
      when '1'
        print 'Age: '
        age = gets.chomp
        print 'Name: '
        name = gets.chomp
        print 'Has parent permission? [Y/N]: '
        parent_permission = gets.chomp.upcase
        # rubocop:disable Metrics/BlockNesting
        case parent_permission
        when 'Y'

          app.create_person('', name, age, true, 'student')
          puts "\nPerson created successfully\n"
        when 'N'
          app.create_person('', name, age, false, 'student')
          puts "\nPerson created successfully\n"
        else
          puts 'Wrong Input'
        end
        # rubocop:enable Metrics/BlockNesting

      when '2'
        print 'Age:'
        age = gets.chomp
        print 'Name:'
        name = gets.chomp
        print 'Specialization:'
        specialization = gets.chomp
        app.create_person(specialization, name, age, true, 'teacher')
        puts "\nPerson created successfully\n"
      else
        puts "\nPlease enter valid input\n "
      end
    when '4'
      print 'Title:'
      title = gets.chomp
      print "\nAuthor:"
      author = gets.chomp
      app.create_book(title, author)
    when '5'
      app.create_rental
    when '6'
      print 'ID of person:'
      id = gets.chomp.to_i
      app.all_rentals_by_person_id(id)
    when '7'
      flag = false
    else
      puts 'Please enter valid input '
    end
  end
end
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize

main
