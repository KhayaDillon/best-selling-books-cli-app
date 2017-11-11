
class BestSellingBooks::AmazonScraper
  extend BestSellingBooks::Collectable

  @@all_books = []

  def self.get_book_list
    #doc = Nokogiri::HTML(open("https://www.amazon.com/gp/bestsellers/2017/books"))
  end

  def self.scrape_book_list
    [
      {Title: "Milk and Honey",
      Author: "Rupi Kaur",
      Price: "$6.70",
      Format: "Paperback",
      Rating: "5/5 Stars",
      Link: "url"},
      {Title: "Hillbilly Elegy: A Memoir of a Family and Culture in Crisis",
      Author: "Vance",
      Price: "$16.70",
      Format: "Hardcover",
      Rating: "5/5 Stars",
      Link: "url"},
    ]
    #["Milk and Honey", "Hillbilly Elegy: A Memoir of a Family and Culture in Crisis"]
  end


end
