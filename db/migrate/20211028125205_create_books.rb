class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.text :title
      t.text :opinion
      t.integer :user_id
      t.string :name

      t.timestamps
    end
  end
end
