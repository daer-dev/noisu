# frozen_string_literal: true

class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table "noisu.boards" do |t|
      t.string   :name,                     null: false
      t.string   :description
      t.string   :picture
      t.string   :slug,                     null: false, index: true
      t.datetime :last_visit
      t.integer  :max_notes
      t.string   :sources_notes_updated_at
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
