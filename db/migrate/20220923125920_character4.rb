class Character4 < ActiveRecord::Migration[7.0]
  def change
    remove_column :characters, :user_id, :string
    add_column :characters, :user_id, :integer
  end
end
