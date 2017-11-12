
class BestSellingBooks::AmazonScraper
  extend BestSellingBooks::Collectable

  @@all_books = []

  def self.get_book_list
    #doc = Nokogiri::HTML(open("https://www.amazon.com/gp/bestsellers/2017/books"))
  end

  def self.scrape_book_list
    [
      {Rank: "1",
      Title: "Milk and Honey",
      Author: "Rupi Kaur",
      Price: "$6.70",
      Format: "Paperback",
      Rating: "5/5 Stars",
      Link: "url"},
      {Rank: "2",
      Title: "Hillbilly Elegy: A Memoir of a Family and Culture in Crisis",
      Author: "Vance",
      Price: "$16.70",
      Format: "Hardcover",
      Rating: "5/5 Stars",
      Link: "url"},
    ]
  end

  def self.all_books
    @@all_books
  end

end
