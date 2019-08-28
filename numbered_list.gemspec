Gem::Specification.new do |s|
  s.name = 'numbered_list'
  s.version = '0.0.4'
  s.date = '2019-08-28'
  s.description = "This is a simpler wrapper object to make it easy to build usefule Enum/Value Objects"
  s.summary = "Enum/Value Object Builder"
  s.authors = ["Dirk Elmendorf"]
  s.email = 'dirk@r26d.com'
  s.files = ["lib/numbered_list.rb", "lib/numbered_list/item_value.rb", "lib/numbered_list/marshall_base.rb"]
  s.homepage = 'https://github.com/r26D/numbered_list'
  s.license = 'MIT'
  s.add_runtime_dependency "activemodel", [">= 0"]
  s.add_runtime_dependency "values", [">= 1.8"]
  s.add_development_dependency 'rspec', '~> 3.7'
  s.add_development_dependency "values", [">= 1.8"]
end
