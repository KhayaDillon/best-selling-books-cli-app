require 'spec_helper'

describe BestSellingBooks::CLI do

  describe "#display_options" do
    it "asks user to select a book and saves the instance of it" do
      cli_instance = BestSellingBooks::CLI.new
      cli_instance.site = BestSellingBooks::AmazonScraper
      cli_instance.site.create_books

      expect(cli_instance.display_options).to include(@books)
    end
  end

    describe "#book" do
      it "saves the instance of a book" do
        cli_instance = BestSellingBooks::CLI.new
        cli_instance.site = BestSellingBooks::AmazonScraper
        cli_instance.site.create_books

        expect(cli_instance.book).to be_instance_of(BestSellingBooks::Books)
      end
    end
end
