# frozen_string_literal: true

class RemoveUserFromSourcesNotes < ActiveRecord::Migration[6.0]
  def change
    remove_column :sources_notes, :user_id
  end
end
