require './book'
require './student'
require './teacher'
require './rental'

class App
    attr_accessor :persons, :rentals, :books

    def initialize
        @persons = []
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
                puts 'There is no people in the list'
            else
                @people.each_with_index do |person, index|
                    puts "#{index} - [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
                end

end 