
module BestSellingBooks::Collectable

  def list_best_sellers
    scrape_book_list.each_with_index do |title, n|
      puts "#{n += 1}. #{title[0]} by #{title[1]}"
    end
  end
end
