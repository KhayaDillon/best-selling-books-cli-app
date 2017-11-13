
class BestSellingBooks::AmazonScraper
  extend BestSellingBooks::Collectable

  @@all_books = []

  def self.get_book_list
    doc = Nokogiri::HTML(open("https://www.amazon.com/gp/bestsellers/2017/books"))
    doc.css('div.zg_itemImmersion').collect do |book_listing|
      {Rank: book_listing.css('span.zg_rankNumber').text.strip,
      Title: book_listing.css('div.p13n-sc-truncated-hyphen').text.strip,
      Author: book_listing.css('a.a-size-small.a-link-child').text.strip,
      Author_Bio: book_listing.css('a.a-size-small.a-link-child').attr('href').value.strip,
      Price: book_listing.css('span.p13n-sc-price').text.strip,
      Format: book_listing.css('span.a-size-small.a-color-secondary').text.strip,
      Rating: book_listing.css('i.a-icon-star').text.strip,
      Link: book_listing.css('a.a-link-normal').attr('href').value.strip
    }
    end
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
