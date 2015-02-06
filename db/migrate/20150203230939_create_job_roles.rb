class CreateJobRoles < ActiveRecord::Migration
  def change
    create_table :job_roles do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.belongs_to :contractor
      t.timestamps
    end
  end
end
