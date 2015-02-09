class AddFieldContractor < ActiveRecord::Migration
  def change
    add_column :contractors, :first_name, :string
    add_column :contractors, :last_name, :string
    add_column :contractors, :mobile_phone, :string
    add_column :contractors, :street, :string
    add_column :contractors, :suburb, :string
    add_column :contractors, :state, :string
    add_column :contractors, :ideal_position, :text
    add_column :contractors, :salary_expectation_amount, :decimal, :precision => 8, :scale => 2
    add_column :contractors, :salary_expectation_type, :string
    add_column :contractors, :qualifications, :text
    add_column :contractors, :dob, :date
    add_column :contractors, :industry_id, :integer
    add_column :contractors, :found_us, :text
  end
end


