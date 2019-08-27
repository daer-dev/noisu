# frozen_string_literal: true

class CreateSchemaNoisu < ActiveRecord::Migration[6.0]
  def up
    execute "CREATE SCHEMA noisu"
  end

  def down
    execute "DROP SCHEMA noisu"
  end
end
