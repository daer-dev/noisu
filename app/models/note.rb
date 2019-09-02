# frozen_string_literal: true

class Note < ApplicationRecord
  self.table_name = "noisu.notes"

  belongs_to :user
  belongs_to :board
end
