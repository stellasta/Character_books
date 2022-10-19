class Character1 < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :image_name, :string
    add_column :characters, :sex, :string
    add_column :characters, :age, :integer
    add_column :characters, :race, :string
    add_column :characters, :height, :integer
    add_column :characters, :hair, :string
    add_column :characters, :eye, :string
    add_column :characters, :skin, :string
    add_column :characters, :form, :string
    add_column :characters, :dress, :string
    add_column :characters, :special, :text
    add_column :characters, :personality1, :string 
    add_column :characters, :personality2, :text
    add_column :characters, :personality3, :string
    add_column :characters, :personality4, :text
    add_column :characters, :personality5, :string
    add_column :characters, :personality6, :text
    add_column :characters, :others1, :text
    add_column :characters, :others2, :text
    add_column :characters, :others3, :text
  end
end
