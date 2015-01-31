module ActiveRecordExtension
  extend ActiveSupport::Concern

  module ClassMethods
    def acts_as_user
      include Member
    end
  end
end

ActiveRecord::Base.send(:include, ActiveRecordExtension)