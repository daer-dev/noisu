RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

FactoryBot.define do
  to_create do |instance|
    raise "Invalid record: #{instance.errors.full_messages.join(', ')}" unless instance.save
  end

  sequence(:slug) { |n| "slug-#{n}" }

  sequence(:text) { |n| "Lorem ipsum dolor sit amet #{n}." }
end
