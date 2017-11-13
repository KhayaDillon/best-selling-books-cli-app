
class BestSellingBooks::AmazonScraper
  extend BestSellingBooks::Collectable

  @@all_books = []

  def self.get_book_list
    Nokogiri::HTML(open("https://www.amazon.com/gp/bestsellers/2017/books"))
  end

  def self.scrape_book_list
    homepage = "https://www.amazon.com"
    get_book_list.css('div.zg_itemImmersion').collect do |book_listing|
      {Rank: book_listing.css('span.zg_rankNumber').text.strip.chop,
      Title: book_listing.css('div.p13n-sc-truncated-hyphen').text.strip,
      Author: book_listing.css('a.a-size-small.a-link-child').text.strip,
      Author_Bio: homepage + book_listing.css('a.a-size-small.a-link-child').attr('href').value.strip,
      Price: book_listing.css('span.p13n-sc-price').text.strip,
      Format: book_listing.css('span.a-size-small.a-color-secondary').text.strip,
      Rating: book_listing.css('i.a-icon-star').text.strip,
      Link: homepage + book_listing.css('a.a-link-normal').attr('href').value.strip}
    end
  end

  def self.all_books
    @@all_books
  end

end
