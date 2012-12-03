FactoryGirl.define do
  factory :manga do
    name "Naruto Something"
    author_id { FactoryGirl.create :author }
  end
end