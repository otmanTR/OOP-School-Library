require './book'
require './student'
require './teacher'
require './rental'

class App
  attr_accessor :people, :rentals, :books

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def book_list
    if @books.empty?
      puts 'There is no book in the list'
    else
      @books.each_with_index do |book, index|
        puts "#{index} - Title: #{book.title.capitalize}, Author: #{book.author.capitalize}"
      end
    end
  end

  def people_list
    if people.empty?
      puts 'There is no person in the list'
    else
      @people.each_with_index do |person, index|
        if person.instance_of?(Teacher)
          puts "#{index} [Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        elsif person.instance_of?(Student)
          puts "#{index} [Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
      end
    end
  end

  def person_create
    puts 'Do you want to create a student (1) or a teacher (2)? [input the number]:'
    type = gets.chomp
    case type
    when '1'
      student_create
    when '2'
      teacher_create
    else
      puts 'Invalid selection'
    end
  end

  def student_create
    puts 'Name:'
    name = gets.chomp
    puts 'Age:'
    age = gets.chomp
    puts 'Has parent permission? [y/n]:'
    permission = gets.chomp.downcase
    parent_permission = permission == 'y'
    @people.push Student.new(age, name, parent_permission: parent_permission)
    puts 'Person created successfully'
  end

  def teacher_create
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Specialization:'
    specialization = gets.chomp
    parent_permission = true
    @people.push Teacher.new(age: age, name: name, specialization: specialization,
                            parent_permission: parent_permission)
    puts 'Person created successfully'
  end

  def new_book
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
  end

  def new_rental

    puts 'select a book from the following list by number'
    book_list
    book_index = gets.chomp.to_i
    rented_book = @books[book_index]

    puts 'Select a person from the following list by numner (not id)'
    people_list
    person_index = gets.chomp.to_i
    renter = @people[person_index]

    puts 'Date: '
    date = gets.chomp
if renter.can_use_services?
    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfullu!'
else 
  puts 'person need borrow permissions'
  end
end 

  def rental_list
    puts 'Enter id of person: '
    people_list
    person_id = gets.chomp.to_i
    person_rentals = @rentals.select { |rental| rental.person.id == person_id }
    return puts 'No rentals found for this ID' if person_rentals.empty?

    person_rentals.each_with_index do |rental, index|
      the_rental = "Rental #{index} - Book: #{rental.book.title}"
      renter = "#{rental.book.author}, Person: #{rental.person.name}, Date: #{rental.date}"
      puts "#{the_rental} by #{renter}"
    end
  end
end
