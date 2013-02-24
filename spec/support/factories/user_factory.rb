FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@ticketee.com" }
    password "password"
    password_confirmation "password"
    factory :admin_user do
      after_create do |user|
        user.confirm!
        user.update_attribute(:admin, true)
      end
    end
    factory :confirmed_user do
      after_create do |user|
        user.confirm!
      end
    end
  end 
end