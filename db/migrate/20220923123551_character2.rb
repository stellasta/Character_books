class Character2 < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :user_id, :integer
  end
end
