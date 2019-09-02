# frozen_string_literal: true

class BoardStat < ApplicationRecord
  self.table_name = "noisu.boards_stats"

  belongs_to :board
end
