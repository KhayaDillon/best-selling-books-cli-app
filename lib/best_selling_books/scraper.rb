class BestSellingBooks::Scraper

  def self.get_book_list(site)
    if site == "Amazon"
      Nokogiri::HTML(open("https://www.amazon.com/gp/bestsellers/#{Time.now.year}/books"))
    elsif site == "B&N"
      Nokogiri::HTML(open("https://www.barnesandnoble.com/b/books/_/N-1fZ29Z8q8"))
    end
  end

  def self.scrape_amazon_book_list
    homepage = "https://www.amazon.com"
    get_book_list("Amazon").css('div.zg_itemImmersion').collect do |book_listing|
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

  def self.scrape_barnesnnoble_book_list
    homepage = "https://www.barnesandnoble.com"
    get_book_list("B&N").css('div.pb-m.mt-m.bd-bottom-disabled-gray.record').collect do |book_listing|
      author_bio = homepage + book_listing.css('div.product-shelf-author.contributors a:first-child').attr('href').value.strip
      {Rank: book_listing.css('div.col-lg-1.count').text.strip,
      Title: book_listing.css('h3.product-info-title a').text.strip,
      Author: book_listing.css('div.product-shelf-author.contributors a:first-child').text.strip,
      Author_Bio: author_bio.include?(" ") ? author_bio.gsub!(' ', '%20') : author_bio,
      Price: book_listing.css('a.current.link').text.strip,
      Format: book_listing.css('a.format').text.strip,
      Rating: book_listing.css('div.product-shelf-ratings').attr('aria-label').value,
      Link: homepage + book_listing.css('div.product-shelf-image.product-image a').attr('href').value}
    end
  end

  def self.create_and_collect_books(site)
    scraper = nil
    if site == "Amazon"
      scraper = self.scrape_amazon_book_list
      site_class = BestSellingBooks::Amazon
    elsif site == "B&N"
      scraper = self.scrape_barnesnnoble_book_list
      site_class = BestSellingBooks::BarnesAndNoble
    end
    scraper.each do |hash|
      instance = BestSellingBooks::Books.new
      instance.title = hash[:Title]
      instance.author = hash[:Author]
      instance.author_bio = hash[:Author_Bio]
      instance.price = hash[:Price]
      instance.format = hash[:Format]
      instance.rating = hash[:Rating]
      instance.link = hash[:Link]
      instance.rank = hash[:Rank]
      site_class.all_books << instance
    end
  end

end
