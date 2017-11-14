
class BestSellingBooks::BarnesAndNoble
  extend BestSellingBooks::Collectable

  @@all_books = []

  def self.all_books
    @@all_books
  end

  def self.name
    "B&N"
  end

  class Scraper
    def self.get_book_list
      doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/books/_/N-1fZ29Z8q8"))
    end

    def self.scrape_book_list
      homepage = "https://www.barnesandnoble.com"
      get_book_list.css('div.pb-m.mt-m.bd-bottom-disabled-gray.record').collect do |book_listing|
        {Rank: book_listing.css('div.col-lg-1.count').text.strip,
        Title: book_listing.css('h3.product-info-title a').text.strip,
        Author: book_listing.css('div.product-shelf-author.contributors a').text.strip,
        Author_Bio: homepage + book_listing.css('div.product-shelf-author.contributors a').attr('href').value.strip,
        Price: book_listing.css('a.current.link').text.strip,
        Format: book_listing.css('a.format').text.strip,
        Rating: book_listing.css('div.product-shelf-ratings').attr('aria-label').value,
        Link: homepage + book_listing.css('div.product-shelf-image.product-image a').attr('href').value}
      end
    end
  end

end
