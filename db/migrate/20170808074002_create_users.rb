# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table "noisu.users" do |t|
      t.string   :login,      null: false
      t.string   :pass,       null: false
      t.string   :email
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
