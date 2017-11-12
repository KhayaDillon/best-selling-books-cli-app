
class BestSellingBooks::CLI
  attr_accessor :site

  def call
    choose_best_sellers_list
    display_options
  end

  def choose_best_sellers_list
    puts "Would you like to see Barnes & Nobles' or Amazon's best sellers of 2017?"
    site = gets.strip
    if site.downcase == "amazon" || site.downcase == "amazon's"
      @site = BestSellingBooks::AmazonScraper
      @site.create_books
      @site.list_best_sellers
    elsif site.downcase == "barnes & noble" || site.downcase == "barnes & noble's" || site.downcase == "b&n"
      @site = BestSellingBooks::BarnesAndNobleScraper
      @site.create_books
      @site.list_best_sellers
    else
      puts "Please type the name of the best sellers list you would like to view."
      choose_best_sellers_list
    end
  end

  def display_options
    puts "Please type a listing number for more information, or type 'Best Sellers' to go back and pick a different top 10 list, or type 'Exit' to leave."
    input = gets.strip
    case input.downcase
    when "exit"
      exit
    when "1"

      choose_info
    when "2"
      choose_info
    when "best sellers"
      call
    else
      puts "Invalid input."
      display_options
    end
  end

  def choose_info
    puts "What would you like to know about this listing?"
    puts "A. Author"
    puts "B. Price"
    puts "C. Available Format"
    puts "D. Site Rating"
    puts "E. Link"

    loop do
      input = gets.strip
      case input.downcase
      when "a"
        puts "Author"
      when "b"
        puts "Price"
      when "c"
        puts "Available Format"
      when "d"
        puts "Site Rating"
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
