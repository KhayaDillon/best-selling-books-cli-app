require 'spec_helper'

describe BestSellingBooks::AmazonScraper do
  describe ".all_books" do
    it "stores all instances of the books that belong to it" do
      expect(BestSellingBooks::AmazonScraper.all_books).not_to eql([])
    end
  end
end
