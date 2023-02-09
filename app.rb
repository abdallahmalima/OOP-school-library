require('./student')
require('./teacher')
require('./classroom')
require('./book')
require('./rental')
require('./listable')
require('./creatable')

class App
  def list_all_books
    ListableBook.new.list
  end

  def list_all_people
    ListablePeople.new.list
  end

  def create_person(specialization, name, age, parent_permission, type)
    CreateablePerson.new.create({ specialization: specialization,
                                  name: name,
                                  age: age,
                                  parent_permission: parent_permission, type: type })
  end

  def create_book(title, author)
    CreateableBook.new.create({ title: title, author: author })
  end

  def create_rental
    CreateableRental.new.create
  end

  def all_rentals_by_person_id(id)
    ListableRental.new.list(id)
  end
end
