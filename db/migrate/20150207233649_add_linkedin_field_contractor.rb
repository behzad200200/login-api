class AddLinkedinFieldContractor < ActiveRecord::Migration
  def change
    add_column :contractors, :bio, :string
    add_column :contractors, :linkedin, :string
  end
end
