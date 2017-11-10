
class BestSellingBooks::CLI

  def call
    choose_best_sellers_list
    display_options
  end

  def list_best_sellers
    puts "1. Milk and Honey by Rupi Kaur"
    puts "2. Hillbilly Elegy: A Memoir of a Family and Culture in Crisis by J. D. Vance"
  end

  def choose_best_sellers_list
    puts "Would you like to see Barnes & Nobles' or Amazon's best sellers of 2017?"
    site = gets.strip
    if site.downcase == "amazon" || site == "amazon's"
      list_best_sellers
    else
      puts "Please type the name of the best seller's list you would like to view."
      choose_best_sellers_list
    end
  end

  def display_options
    puts "Please choose a listing number for more information. Or type exit."
    input = gets.strip
    until input == "exit"
      if input == "1" || input == "2"
        puts "What would you like to know?"
        puts "A. Genre"
        puts "B. Plot Summary"
        puts "C. Author Bio"
        puts "D. Prices & Formats"
        puts "E. Link"
      else
        puts "Invalid input."
        display_options
      end

      until input == "exit"
        input = gets.strip
        case input
        when "A", "a"
          puts "Genre"
        when "B", "b"
          puts "Plot Summary"
        when "C", "c"
          puts "Author Bio"
        when "D", "d"
          puts "Price n format"
        when "E", "e"
          puts "Link"
        when "best sellers"
          call
        end
      end
    end
  end

end
