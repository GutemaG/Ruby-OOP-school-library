class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(retnal)
    @rentals.push(rental)
    rental.person = self
    rental.book.rentals.push(rental) unless rental.book.rentals.include?(rental)
  end

  def display_rentals
    return 'No Rentals' unless @rentals.length.positive?
    rentals.each { |rent| puts("#{rent.date} | #{rent.person.name} | #{rent.book.title}") }
  end

end
