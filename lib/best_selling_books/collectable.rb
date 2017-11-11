require 'pry'

module BestSellingBooks::Collectable

  def create_books
    scrape_book_list.each do |hash|
      instance = BestSellingBooks::Books.new
      instance.title = hash[:Title]
      instance.author = hash[:Author]
      instance.price = hash[:Price]
      instance.format = hash[:Format]
      instance.rating = hash[:Rating]
      instance.link = hash[:Link]
      self.all_books << instance
    end
  end

  def list_best_sellers
    binding.pry
    self.all_books.each {|instance| puts "#{instance.title}"}

    #scrape_book_list.each_with_index do |hash, n|
    #  puts "#{n += 1}. #{hash[:Title]}"
    #end
  end
end
