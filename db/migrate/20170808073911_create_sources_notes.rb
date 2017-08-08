class CreateSourcesNotes < ActiveRecord::Migration[5.0]
  def change
    create_table 'noisu.sources_notes' do |t|
      t.references :board,   null: false
      t.references :source,  null: false
      t.references :user,    null: false
      t.text       :content, null: false
      t.string     :url
      t.datetime   :created_at
      t.datetime   :updated_at
    end
  end
end
