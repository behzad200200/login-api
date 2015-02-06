class JobRole < ActiveRecord::Base
  belongs_to :contractor, autosave: true
end
