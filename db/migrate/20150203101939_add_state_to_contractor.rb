class AddStateToContractor < ActiveRecord::Migration
  def change
    add_column :contractors,:states, :text, array: true, default: []
  end
end
