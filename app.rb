require './student'
require './teacher'
require './book'
require './rental'

class App
  attr_reader :books, :rentals, :people
  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def list_of_books
    puts "\nNo books in the Library\n\n" unless @books.length.positive?
    @books.each { |book| puts("Title: #{book.title}, Author: #{book.author}\n")  }
  end

  def list_of_people
    puts "\nNo People found\n\n" unless @people.length.positive?
    @people.each { |person| puts("  [#{person.class}] ID: #{person.id} Name: #{person.name} Age: #{person.age}") }
  end

  def create_a_person
    puts "Create a person"
    print "Do you want to create a student (1) or a teacher (2)?[Input the Number]: "
    person_type = gets.chomp.to_i
    if ![1,2].include? person_type
      puts "Invalid choice"
    else
      print 'Age: '
      age = gets.chomp.to_i
      print 'Name: '
      name = gets.chomp
      case person_type
      when 1
        create_student(age, name)
      when 2
        create_teacher(age, name)
      end
    end
  end

  def create_student(age, name)
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp.downcase
      if permission == 'y'
        parent_permission = true
      elsif permission == 'n'
        parent_permission = false
      else
        puts 'Invalid option, person could not be created'
      end
    student = Student.new(age, nil, name, parent_permission: parent_permission)
    @people.push(student)
    puts 'Student created successfully!'
  end

  def create_teacher(age, name)
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @people.push(teacher)
    puts 'Teacher created successfully!'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts @books.length
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the list by number'
    @books.each_with_index { |book, i| puts(" #{i}) | Title: #{book.title} Author: #{book.author} |") }
    index = gets.chomp.to_i
    book = @books[index]

    puts 'Select a person from the list by number (not ID)'
    @people.each_with_index do |person, i|
      puts("  #{i}) [#{person.class}] ID: #{person.id} Name: #{person.name} Age: #{person.age}")
    end
    index = gets.chomp.to_i
    person = @people[index]

    date = Time.now.strftime('%m/%d/%y')
    rental = Rental.new(date, book, person)
    @rentals.push(rental)
    person.rentals.push(rental)
    book.rentals.push(rental)
    puts "Date:  #{date}"
    puts('Book has been rented successfully')
  end
  def list_all_rentals_per_person
    print "ID of person: "
    person_id = gets.chomp.to_i
    person = @people.select{|per| per.id == person_id}
    puts 'No Person found' unless person.length.positive?
    puts 'Rentals: '
    person[0].rentals.each { |rent| puts ("Date: #{rent.date}, Book #{rent.book.title} by #{rent.person.name}")}
  end
end
