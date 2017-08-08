class CreateBoardsSources < ActiveRecord::Migration[5.0]
  def change
    create_table 'noisu.boards_sources' do |t|
      t.references :board,      null: false
      t.references :source,     null: false
      t.datetime   :created_at
      t.datetime   :updated_at
    end
  end
end
