FactoryBot.define do
  factory :category do
    name{ "Category 123" }
  end
end

#Factory Pattern

# c0 = Category.new(name: 'Category 123')
#puts c0.name  => "Category 123"

# c1 = FactoryBot.create(:category)
#puts c1.name  => "Category 123"

