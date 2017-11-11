
class BestSellingBooks::BarnesAndNobleScraper
  extend BestSellingBooks::Collectable

  def self.scrape_book_list
    #doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/books/_/N-1fZ29Z8q8"))
    [
      ["The Rooster Bar", "John Grisham"],
      ["Obama: An Intimate Portrait", "Pete Souza"]
    ]
  end

  def self.scrape_book_info

  end

end
