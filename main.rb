require './lib/app'

def menu
  puts('-------------------------------------')
  puts('Please choose an option by entering a number: ')
  print('-------------------------------------')
  print("
  1 - List all books
  2 - List all people
  3 - Create a person
  4 - Create a book
  5 - Create a rental
  6 - List all rentals for a give person id
  7 or 0 - Exit
  ")
end

def run_app(app, method)
  case method
  when 1
    app.list_of_books
  when 2
    app.list_of_people
  when 3
    app.create_a_person
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    app.list_all_rentals_per_person
  else
    puts 'Invalid option. Please enter a valid option'
  end
end

def main
  app = App.new
  choice = -1
  until choice == 7 || choice.zero?
    menu
    choice = gets.chomp.to_i
    run_app(app, choice) unless choice == 7
  end
  puts 'Thank you for using this app'
end

puts 'Welcome to School Library App!'
main
