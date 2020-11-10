class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :role
      t.string :name
      t.boolean :active

      t.timestamps
    end
  end
end
