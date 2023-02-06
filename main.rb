require('./app')
require('./menu')
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
  flag = menu(inputs, app) while flag
end

main
