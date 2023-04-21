require './book'
require './student'
require './teacher'
require './rental'

class App
    attr_accessor :persons, :rentals, :books

    def initialize
        @people = []
        @books = []
        @rentals = []
    end

    def book_list
        if books.length = 0
            puts 'There is no book in the list'
        else
            @books.each_with_index do |book, index|
                puts "#{index} - Title: #{book.title.capitalize}, Author: #{book.outhor.capitalize}"
            end
        end

        def people_list
            if people.length = 0
                puts 'There is no person in the list'
            else
                @people.each_with_index do |person, index|
                    puts "#{index} - [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
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
                parent_permission == permission = 'y'
                puts 'Classroom:'
                @people << Student.new(age: age, name: name, parent_permission: parent_permission, classroom: classroom)
                puts 'Person created successfully'
            end

      def teacher_create
        puts 'Age:'
        age=gets.chomp
        name = gets.chomp
        puts 'Specialization:'
        specialization = gets.chomp
        parent_permission = true
        @persons << Teacher.new(age: age, name: name, specialization: specialization, parent_permission: parent_permission)
        puts 'Person created successfully'
      end
    
      def new_rental
        puts 'Select a person from the following list by numner (not id)'
        people_list
        person_index = gets.chomp.to_i

        puts 'select a book from the following list by number'
        book_list
        book_index = gets.chomp.to_i

        puts 'Date: '
        date = gets.chomp

        @rentals << Rental.new(date, @books[book_index], @people[person_index])
        puts 'Rental created successfullu!'
      end

end 