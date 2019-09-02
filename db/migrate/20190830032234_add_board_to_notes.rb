# frozen_string_literal: true

class AddBoardToNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :board_id, :integer,
      after: :user_id,
      index: true,
      null:  true
  end
end
