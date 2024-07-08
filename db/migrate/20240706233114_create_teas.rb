class CreateTeas < ActiveRecord::Migration[7.1]
  def change
    create_table :teas do |t|
      t.string :title
      t.string :description
      t.integer :temp
      t.integer :brew_time

      t.timestamps
    end
  end
end
