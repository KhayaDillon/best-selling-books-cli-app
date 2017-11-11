
module BestSellingBooks::Collectable

  def list_best_sellers
    scrape_book_list.each_with_index do |hash, n|
      puts "#{n += 1}. #{hash[:Title]}"
    end
  end
end
