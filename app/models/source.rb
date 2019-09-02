# frozen_string_literal: true

class Source < ApplicationRecord
  self.table_name = "noisu.sources"

  has_many :boards_sources
  has_many :boards,         through: :boards_sources
end
