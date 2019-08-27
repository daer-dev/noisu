# frozen_string_literal: true

class Board < ApplicationRecord
  include SluggedName

  self.table_name = "noisu.boards"

  before_save :set_slug

  private

    def slug_candidates
      [
        self.name,
        "#{self.name}-#{self.description.truncate(10)}",
        "#{self.id}-#{self.name}-#{self.description.truncate(10)}"
      ]
    end
end
