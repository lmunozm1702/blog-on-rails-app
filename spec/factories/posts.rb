FactoryBot.define do
  factory :post do
    title { 'Title Dummie' }
    text { 'Text for dummie' }
    comments_counter { 1 }
    likes_counter { 2 }
    author_id { 3 }
  end
end
