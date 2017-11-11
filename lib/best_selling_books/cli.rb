
class BestSellingBooks::CLI

  def call
    choose_best_sellers_list
    display_options
  end

  def choose_best_sellers_list
    puts "Would you like to see Barnes & Nobles' or Amazon's best sellers of 2017?"
    site = gets.strip
    if site.downcase == "amazon" || site.downcase == "amazon's"
      BestSellingBooks::AmazonScraper.list_best_sellers
    elsif site.downcase == "barnes & noble" || site.downcase == "barnes & noble's" || site.downcase == "b&n"
      BestSellingBooks::BarnesAndNobleScraper.list_best_sellers
    else
      puts "Please type the name of the best sellers list you would like to view."
      choose_best_sellers_list
    end
  end

  def display_options
    puts "Please type a listing number for more information, or type 'Best Sellers' to go back and pick a different top 10 list, or type 'Exit' to leave."
    input = gets.strip
    if input.downcase == "exit"
      exit
    elsif input == "1" || input == "2"
      choose_info
    elsif input.downcase == "best sellers"
      call
    else
      puts "Invalid input."
      display_options
    end
  end

  def choose_info
    puts "What would you like to know about this listing?"
    puts "A. Genre"
    puts "B. Plot Summary"
    puts "C. Author Bio"
    puts "D. Prices & Formats"
    puts "E. Link"

    loop do
      input = gets.strip
      case input.downcase
      when "a"
        puts "Genre"
      when "b"
        puts "Plot Summary"
      when "c"
        puts "Author Bio"
      when "d"
        puts "Price n format"
      when "e"
        puts "Link"
      when "best sellers"
        call
      when "exit"
        exit
      else
        puts "Invalid input."
      end
    end
  end

end
