class RenameQueueTableName < ActiveRecord::Migration[5.2]
  def self.up
    rename_table :user_queues, :queue_selections
  end

  def self.down
    rename_table :queue_selections, :user_queues
  end
end
