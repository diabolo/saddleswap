class CreateSaddles < ActiveRecord::Migration
  def change
    create_table :saddles do |t|
      t.string :manufacturer
      t.string :model
    end
  end
end
