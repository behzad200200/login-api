  class Contractor < ActiveRecord::Base
    acts_as_user
    validates_presence_of :first_name,
        :last_name,
        :mobile_phone,
        :street,
        :state,
        :suburb
  end
