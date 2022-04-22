class RemoveGnreIdFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :gnre_id, :integer
  end
end
