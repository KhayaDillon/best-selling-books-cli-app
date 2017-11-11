
class BestSellingBooks::AmazonScraper
  extend BestSellingBooks::Collectable

  @@all_books = []

  def self.scrape_book_list
    #doc = Nokogiri::HTML(open("https://www.amazon.com/gp/bestsellers/2017/books"))
    [
      ["Milk and Honey", "Rupi Kaur"],
      ["Hillbilly Elegy: A Memoir of a Family and Culture in Crisis", "J. D. Vance"]
    ]
  end

  def self.scrape_book_info

  end

end
