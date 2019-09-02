# frozen_string_literal: true

class SourcesNote < ApplicationRecord
  self.table_name = "noisu.sources_notes"

  belongs_to :board
  belongs_to :source
end
