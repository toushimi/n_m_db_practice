class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.text :description
      t.references :owner, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
    add_index :groups, :name, unique: true
  end
end
