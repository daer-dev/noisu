# frozen_string_literal: true

class AddUserToBoards < ActiveRecord::Migration[6.0]
  def change
    add_column :boards, :user_id, :integer,
      after: :slug,
      index: true,
      null:  true
  end
end
