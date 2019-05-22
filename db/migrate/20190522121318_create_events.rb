class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.string :place
      t.references :users, foreign_key: true

      t.timestamps
    end
    add_index :events, :name
  end
end
