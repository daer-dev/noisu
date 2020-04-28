# frozen_string_literal: true

class Board < ApplicationRecord
  include SluggedName

  self.table_name = "noisu.boards"

  belongs_to :user
  has_many   :notes
  has_many   :sources_notes
  has_many   :boards_sources
  has_many   :sources,        through: :boards_sources

  before_save :set_slug

  # Not named just "public" as it's an AR reserved word.
  scope :public_boards, -> { where(public_board: true) }

  # This method controls where the board's content is going to be published.
  # "all" and any future category are meant to show notes publicly.
  def broadcast
    content = [ self.id ]

    content.push('all') if self.public_board

    content
  end

  private

    def slug_candidates
      [
        self.name,
        "#{self.name}-#{self.description.truncate(10)}",
        "#{self.id}-#{self.name}-#{self.description.truncate(10)}"
      ]
    end
end
