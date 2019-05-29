class CreateStars < ActiveRecord::Migration[5.2]
  def change
    create_table :stars do |t|
      t.references :movie
      t.references :actor
      t.timestamps
    end
  end
end
