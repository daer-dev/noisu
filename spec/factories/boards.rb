# frozen_string_literal: true

FactoryBot.define do
  factory :board do
    name        { generate(:text) }
    description { generate(:text) }

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
