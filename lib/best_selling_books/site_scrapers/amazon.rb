
class BestSellingBooks::AmazonScraper
  extend BestSellingBooks::Collectable

  @@all_books = []

  def self.get_book_list
    binding.pry
    doc = Nokogiri::HTML(open("https://www.amazon.com/gp/bestsellers/2017/books"))
    doc.css('span.zg_rankNumber').text
    doc.css('div.p13n-sc-truncated-hyphen').text
    doc.css('a.a-size-small.a-link-child').text
    doc.css('span.p13n-sc-price').text
    doc.css('span.a-size-small.a-color-secondary').text
    doc.css('i.a-icon-star').text
    doc.css('').text
  end

  def self.scrape_book_list
    [
      {Rank: "1",
      Title: "Milk and Honey",
      Author: "Rupi Kaur",
      Author_Bio: "url",
      Price: "$6.70",
      Format: "Paperback",
      Rating: "5/5 Stars",
      Link: "url"},
      {Rank: "2",
      Title: "Hillbilly Elegy: A Memoir of a Family and Culture in Crisis",
      Author: "Vance",
      Author_Bio: "url",
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
