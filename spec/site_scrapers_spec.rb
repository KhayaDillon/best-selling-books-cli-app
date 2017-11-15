require 'spec_helper'

describe BestSellingBooks::Amazon do
  describe ".all_books" do
    it "stores all instances of the books that belong to it" do
      BestSellingBooks::Amazon.create_and_collect_books
      expect(BestSellingBooks::Amazon.all_books).not_to eql([])
    end
  end
end
