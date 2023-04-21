require './app'

def main
    menu = 'Please choose an option by entering a number:
      1 - List all books
      2 - List all people
      3 - Create a person
      4 - Create a book
      5 - Create a rental
      6 - List all rentals for a given person id
      7 - Exit'
  
    app = App.new
    while menu
      puts menu
      selected = gets.chomp.to_i
      exit if selected == 7
  
      run(selected, app)
    end
  end
  
  def run(selected, app)
    case selected
    when 1
      app.book_list
    when 2
      app.people_list
    when 3
      app.person_create
    when 4
      app.new_book
    when 5
      app.new_rental
    when 6
      app.rental_list
    else
      puts 'Invalid input. Please try again'
    end
  end
  
  main