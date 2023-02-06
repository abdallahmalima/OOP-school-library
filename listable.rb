class Listable
  def list(items)
    raise NotImplementedError, 'You should implement list method in you class'
  end
end

class ListableBook < Listable
  def list(books)
    if books.length.eql?(0)
      puts 'There is no books '
    else
      count = 0
      books.each do |single|
        puts "#{count}) Title: \"#{single.title}\" , Author: #{single.author}"
        count += 1
      end
    end
  end
end

class ListablePeople < Listable
  def list(persons)
    if persons.length.eql?(0)
      puts "\n There is no persons\n"
    else
      count = 0
      persons.each do |single|
        puts "#{count}) [#{single.class}] Name: #{single.name},ID: #{single.id}, Age: #{single.age} "
        count += 1
      end
    end
  end
end

class ListableRental
  def list(id, rentals)
    rentals.each do |single|
      puts single.person.id
      puts "Date: #{single.date},Book \"#{single.book.title}\" by #{single.book.author}" if single.person.id.eql? id
    end
  end
end
