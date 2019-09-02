# frozen_string_literal: true

class BoardSource < ApplicationRecord
  self.table_name = "noisu.boards_sources"

  belongs_to :board
  belongs_to :source
end
