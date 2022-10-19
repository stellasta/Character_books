class Users1 < ActiveRecord::Migration[7.0]
  def change
    add_column:users, :name, :string
    add_column:users, :email, :string
    remove_column:users, :user_id, :integer
  end
end
