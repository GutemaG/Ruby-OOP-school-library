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
    puts 'List of peopls'
  end

  def create_student
    name = 'Birhanu'
    age = 25
    parent_permission = true
    student = Student.new(age, nil, name, parent_permission: parent_permission)
    @people.push(student)
    puts 'Student created successfully!'
  end

  def create_teacher
    name = 'Birhanu'
    age = 25
    parent_permission = true
    teacher = Teacher.new(age, nil, name, parent_permission: parent_permission)
    @people.push(teacher)
    puts 'Teacher created successfully!'
    teacher
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
