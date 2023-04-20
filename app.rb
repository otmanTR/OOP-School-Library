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

end 