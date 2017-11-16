# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "best_selling_books/version"

Gem::Specification.new do |spec|
  spec.name          = "best_selling_books"
  spec.version       = BestSellingBooks::VERSION
  spec.authors       = ["'Khaya Ramcharita-Dillon'"]
  spec.email         = ["'yahyal0v3@yahoo.com'"]

  spec.summary       = %q{Best Selling Books Lister}
  spec.description   = %q{Lists the best selling books from Amazon and B&N and provides information about each book.}
  spec.homepage      = "https://learn.co"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
end
