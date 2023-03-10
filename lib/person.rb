require './lib/nameable'
require './lib/capitalize_decorator'
require './lib/trimmer_decorator'
require './lib/rental'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.person = self
    rental.person.rentals.push(rental) unless rental.person.rentals.include?(rental)
  end

  def display_rentals
    p('No Rentals') unless @rentals.length.positive?
    rentals.each { |rent| puts("#{rent.date} | #{rent.person.name} | #{rent.book.title}") }
  end

  private

  def of_age?
    @age >= 18
  end
end
