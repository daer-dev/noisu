# frozen_string_literal: true

module Concerns
  module SluggedName
    extend ActiveSupport::Concern

    included do
      extend FriendlyId

      # We set our reserved words like this to avoid overwriting/repeating the Rails default ones.
      friendly_id_config.reserved_words.concat((ENV["FRIENDLY_ID_RESERVED_WORDS"] || []).split(","))

      friendly_id :slug_candidates, use: :slugged

      after_validation :move_friendly_id_error_to_name

      private

        # Assigns the validation error to the name field if FriendlyId fails generating a slug.
        def move_friendly_id_error_to_name
          errors.add :name, *errors.delete(:friendly_id) if errors[:friendly_id].present?
        end
    end
  end
end
