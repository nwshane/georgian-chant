FactoryGirl.define do
  factory :chant do
    sequence(:title) { |x| "საგალობელი#{x}" }
  end
end
