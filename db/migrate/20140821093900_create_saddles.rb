class CreateSaddles < ActiveRecord::Migration
  def change
    create_table :manufacturers do |t|
      t.string :name
    end

    create_table :saddles do |t|
      t.string :model
      t.belongs_to :manufacturer
    end
  end
end
