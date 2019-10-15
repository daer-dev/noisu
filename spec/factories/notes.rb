FactoryBot.define do
  factory :note do
    content { generate(:text) }
  end
end
