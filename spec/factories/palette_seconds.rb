FactoryBot.define do
  factory :palette_second do
    main { '#FF0000' }
    sub { '#FF0000' }
    body { '#FF0000' }
    bg {'#FF0000' }
    association :user
  end
end
