  class Contractor < ActiveRecord::Base
    acts_as_user
    has_many :job_roles
    validates_presence_of :first_name,
        :last_name,
        :mobile_phone,
        :street,
        :state,
        :suburb
    accepts_nested_attributes_for :user, :job_roles

    def user_attributes
      user.present? ? user.attributes : {}
    end

    def job_roles_attributes
      job_roles.present? ? job_roles.map(&:attributes) : []
    end

    def json_response
      to_json(methods: [:user_attributes, :job_roles_attributes])
    end
  end
