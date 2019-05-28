class CreateQueues < ActiveRecord::Migration[5.2]
  def change
    create_table :user_queues do |t|
      t.reference :movie
      t.reference :user
      t.timestamps
    end
  end
end
