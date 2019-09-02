# frozen_string_literal: true

class AddScopeToBoards < ActiveRecord::Migration[6.0]
  def change
    # "public_board" as column name instead of just "public" as it's a reserved word in Postgres, Rails and some other systems.
    add_column :boards, :public_board, :boolean,
      after:   :user_id,
      null:    false,
      default: true
  end
end
