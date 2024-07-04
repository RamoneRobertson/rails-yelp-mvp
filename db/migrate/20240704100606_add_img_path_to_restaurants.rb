class AddImgPathToRestaurants < ActiveRecord::Migration[7.1]
  def change
    add_column :restaurants, :img_path, :string
  end
end
