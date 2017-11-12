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
      instance.rank = hash[:Rank]
      self.all_books << instance
    end
  end

  def list_best_sellers
    self.all_books.each {|instance| puts "#{instance.rank}. #{instance.title}"}
  end
end
