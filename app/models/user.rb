# frozen_string_literal: true

class User < ApplicationRecord
  self.table_name = "noisu.users"

  has_many :boards
  has_many :notes
end
