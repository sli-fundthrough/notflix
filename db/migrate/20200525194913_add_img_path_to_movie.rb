class AddImgPathToMovie < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :img_path, :string
  end
end
