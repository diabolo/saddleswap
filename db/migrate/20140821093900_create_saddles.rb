class CreateSaddles < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
    end

    create_table :saddles do |t|
      t.string :model
      t.belongs_to :brand
    end
  end
end
