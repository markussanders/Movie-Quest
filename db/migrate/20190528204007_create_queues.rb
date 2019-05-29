class CreateQueues < ActiveRecord::Migration[5.2]
  def change
    create_table :user_queues do |t|
      t.references :movie
      t.references :user
      t.timestamps
    end
  end
end
