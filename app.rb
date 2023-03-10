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
    puts 'List_of_books'
  end

  def list_of_people
    puts 'List of peopls sssssssssss'
  end

  def create_a_person
    puts "Create a person"
    print "Do you want to create a studnet (1) or a teacher (2)?[Input the Number]: "
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
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name, parent_permission: parent_permission)
    @people.push(teacher)
    puts 'Teacher created successfully!'
  end

  def create_book
    title = "Dertogada"
    author = "Yismahk worku"
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
  end

  def create_rental
    create_book()
    create_teacher()

    book = @books[0]
    person = @people[0]
    date = Time.now.strftime('%m-%d-%y')
    rental = Rental.new(date, person, book)
    book.add_rental(person, date)
    @rentals.push(rental)
    puts('Book has been rented successfully')

  end
end
