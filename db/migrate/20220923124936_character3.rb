class Character3 < ActiveRecord::Migration[7.0]
  def change
    remove_column :characters, :age, :integer
    remove_column :characters, :height, :integer
    remove_column :characters, :user_id, :integer
    add_column :characters, :age, :string
    add_column :characters, :height, :string
    add_column :characters, :user_id, :string
  end
end
