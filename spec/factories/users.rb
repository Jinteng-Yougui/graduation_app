FactoryBot.define do
  factory :user do
    name { 'kondo@kondo.com' }
    email { 'kondo@kondo.com' }
    password { 'kondo@kondo.com' }
    password_confirmation { 'kondo@kondo.com'}
    admin { 'false' }
  end
  factory :admin_user, class: User do
    name { 'yuki@yuki.com' }
    email { 'yuki@yuki.com' }
    password { 'yuki@yuki.com' }
    password_confirmation { 'yuki@yuki.com' }
    admin { 'true' }
  end
end
