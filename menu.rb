class Menu
  def initialize(app)
    @app = app
  end

  def display(inputs)
    puts inputs
    choice = gets.chomp
    handle_choice(choice)
  end

  private

  # rubocop:disable Metrics/CyclomaticComplexity
  def handle_choice(choice)
    case choice
    when '1'
      @app.list_all_books
    when '2'
      @app.list_all_people
    when '3'
      handle_sub_choice
    when '4'
      handle_create_book
    when '5'
      @app.create_rental
    when '6'
      handle_all_rentals_by_person_id
    when '7'
      return false
    else
      puts 'Please enter a valid input'
    end
    true
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def handle_sub_choice
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    sub_choice = gets.chomp
    case sub_choice
    when '1'
      handle_create_student
    when '2'
      handle_create_teacher
    else
      puts "\nPlease enter a valid input\n"
    end
  end

  def handle_create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.upcase
    create_person('', name, age, parent_permission == 'Y', 'student')
  end

  def handle_create_teacher
    print 'Age:'
    age = gets.chomp
    print 'Name:'
    name = gets.chomp
    print 'Specialization:'
    specialization = gets.chomp
    create_person(specialization, name, age, true, 'teacher')
  end

  def handle_create_book
    print 'Title:'
    title = gets.chomp
    print "\nAuthor:"
    author = gets.chomp
    @app.create_book(title, author)
  end

  def handle_all_rentals_by_person_id
    print 'ID of person:'
    id = gets.chomp.to_i
    @app.all_rentals_by_person_id(id)
  end

  def create_person(specialization, name, age, has_permission, type)
    @app.create_person(specialization, name, age, has_permission, type)
    puts "\nPerson created successfully\n"
  end
end

def menu(inputs, app)
  menu = Menu.new(app)
  menu.display(inputs)
end
