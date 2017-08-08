class CreateBoardsStats < ActiveRecord::Migration[5.0]
  def change
    create_table 'noisu.boards_stats' do |t|
      t.references :board,      null: false
      t.integer    :num_notes,  null: false, default: 0
      t.integer    :avg_notes,  null: false, default: 0
      t.datetime   :created_at
      t.datetime   :updated_at
    end
  end
end
