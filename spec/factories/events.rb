FactoryBot.define do
  factory :event do
    title { 'code hangout' }
    description { 'A get together party for noob developers' }
    date { '2019-09-23 14:46:24' }
    location { 'Arkansas' }
    association :creator, factory: :user
  end

  factory :random_event, class: Event do
    title { Faker::Title.title }
    description { Faker::Description.description }
    date { Faker::Date.date }
    location { Faker::Location.location }
    association :creator, factory: :user
  end
end
