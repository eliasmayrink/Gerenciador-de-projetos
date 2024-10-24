class AddColumnFinishedToActivities < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :finished, :boolean, default: false
  end
end
