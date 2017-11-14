
class BestSellingBooks::CLI

  def call
    choose_best_sellers_list
    choose_listing
  end

  def choose_best_sellers_list
    puts ">> Would you like to see Barnes & Noble's or Amazon's best sellers of #{Time.now.year}?"
    site = gets.strip
    case site.downcase
    when "amazon", "amazon's"
      @site = BestSellingBooks::Amazon
      @site.create_books if @site.all_books == []
      @site.list_best_sellers
    when "barnes & noble", "barnes & noble's", "barnes and noble", "barnes and noble's", "b&n"
      @site = BestSellingBooks::BarnesAndNoble
      @site.create_books if @site.all_books == []
      @site.list_best_sellers
    when "exit"
      exit
    else
      puts "Invalid input. Please type the name of the best sellers list you would like to view."
      choose_best_sellers_list
    end
  end

  def display_other_options
    puts "> Or type 'List' to return to the list, 'Best Sellers' to pick a different top 20 list, or 'Exit' to leave."
  end

  def choose_listing
    puts ">> Please type a listing number for more information."
    display_other_options
    input = gets.strip
    if input.downcase == "exit"
      exit
    elsif input.to_i != 0
      @book = @site.all_books.detect {|instance| instance.rank == input }
      choose_info
    elsif input.downcase == "list"
      @site.list_best_sellers
      choose_listing
    elsif input.downcase == "best sellers"
      call
    else
      puts "Invalid input."
      choose_listing
    end
  end

  def choose_info
    puts @book.title
    puts "A. Author Bio"
    puts "B. Price"
    puts "C. Available Format"
    puts "D. Site Rating"
    puts "E. Link"
    puts ">> What would you like to know about this listing? Please select a letter."

    loop do
      input = gets.strip
      case input.downcase
      when "a"
        puts "About " + @book.author
        puts @book.author_bio
      when "b"
        puts @book.price
      when "c"
        puts @book.format
      when "d"
        puts @book.rating
      when "e"
        puts @book.link
      when "list"
        @site.list_best_sellers
        choose_listing
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
