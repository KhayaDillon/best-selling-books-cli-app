
class BestSellingBooks::BarnesAndNobleScraper
  extend BestSellingBooks::Collectable

  def self.get_book_list
    #doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/books/_/N-1fZ29Z8q8"))
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
  end


end
