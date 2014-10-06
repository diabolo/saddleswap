class AddImageToSaddles < ActiveRecord::Migration
  def change
    add_column :saddles, :image, :string
  end
end
