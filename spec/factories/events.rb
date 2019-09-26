FactoryBot.define do
  factory :event do
<<<<<<< HEAD
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
=======
    title 'MyString'
    description 'MyText'
    date '2019-09-23 14:46:24'
    location 'MyString'
>>>>>>> 0d36ce64fa941d89f6dc182548d194166f04275a
  end
end
