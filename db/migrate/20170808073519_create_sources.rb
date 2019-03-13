# frozen_string_literal: true

class CreateSources < ActiveRecord::Migration[5.0]
  def change
    create_table "noisu.sources" do |t|
      t.string   :name,         null: false
      t.text     :source_attrs
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
