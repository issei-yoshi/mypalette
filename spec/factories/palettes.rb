FactoryBot.define do
  factory :palette do
    main { '#FF0000' }
    sub { '#FF0000' }
    body { '#FF0000' }
    bgimage { 'Yellow' }
    association :user
  end
end