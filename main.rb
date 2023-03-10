require './app'

def menu
  puts('-------------------------------------')
  puts("Pick an option by entering a number")
  print('-------------------------------------')
  print("
  1 - List all books
  2 - List all people
  3 - Add a book
  4 - Add a person
  5 - Rent a book
  6 - List rents of a person
  7 - Exit
  ")
end

def main
  menu()
  app = App.new
  options = {
    1 => 'list_of_books',
    2 => 'list_of_people',
    3 => 'create_book',
    4 => 'create_a_person',
    5 => 'create_rental',
    6 => 'list_all_rentals_for_person',
    7 => 'exit'
  }
  choice = gets.chomp.to_i
  case choice
  when 1..6
    app.send(options[choice]) unless choice == 7
  when 7
    puts 'Thank you for using the app'
    abort
  else
    puts 'Invalid Input'
  end
  main()
  puts 'Thank you for using the app'
end

main()