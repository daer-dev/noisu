FactoryBot.define do
  factory :board do
    trait :with_notes do
      transient do
        num_notes { 5 }
      end

      after(:create) do |board, evaluator|
        evaluator.num_notes.times do
          create(:note, board_id: board.id)
        end
      end
    end
  end
end
