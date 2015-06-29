FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "Person_#{n}@example.com" }
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :movie do
    imdb    "movie12345"
    name    "take me to your heart"
    director "jhon"
    actors  "Milke"
    genre   "dsdfs"
    duration 30
    image_file_name "movie12345"
    image_content_type "image/png"
    image_file_size 2000000   
  end
end
