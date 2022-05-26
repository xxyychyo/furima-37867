FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    first_name {'太郎'}
    last_name {'山田'}
    first_name_kana {'タロウ'}
    last_name_kana {'ヤマダ'}
    birthday { Faker::Date.birthday }
  end
end