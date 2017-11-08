
class BestSellingBooks::CLI

  def call
    puts "Welcome to Top 10 Best Selling Books"
    puts "Would you like to see Barnes & Nobles' or Amazon's best sellers of 2017?"
    site = gets.strip
    if site == "Amazon" || site == "Amazon's"
      list_best_sellers
    end

    puts "Choose a listing number for more information. Or type exit."
    input = nil
    until input == "exit"
      input = gets.strip
      if input == "1" || "2"
        puts "What would you like to know?"
          puts "A. Genre"
          puts "B. Plot Summary"
          puts "C. Author Bio"
          puts "D. Prices & Formats"
          puts "E. Link"
      end

      info = gets.strip
      case info
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
      end
    end
  end

  def list_best_sellers
    puts "1. Milk and Honey by Rupi Kaur"
    puts "2. Hillbilly Elegy: A Memoir of a Family and Culture in Crisis by J. D. Vance"
  end

end
