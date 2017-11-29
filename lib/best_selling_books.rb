require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative "./best_selling_books/version"
require_relative "./best_selling_books/cli"
require_relative "./best_selling_books/books"
require_relative "./best_selling_books/scraper"

require_relative "./best_selling_books/sites/amazon"
require_relative "./best_selling_books/sites/barnes_n_noble"
