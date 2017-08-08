class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table 'noisu.notes' do |t|
      t.references :user,       null: false
      t.text       :content
      t.datetime   :created_at
      t.datetime   :updated_at
    end
  end
end
