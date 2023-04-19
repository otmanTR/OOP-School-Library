class Book
    attr_accessor :title, :author
    attr_reader :students

    def initialize (title, author)
        @title = title
        @author = author
    end
end