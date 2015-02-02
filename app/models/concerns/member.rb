module Member
  def self.included(base)
    base.has_one :user, as: :member
  end

  def validate_user
    unless user.valid?
      user.errors.each do |attr, msg|
        errors.add(attr, msg)
      end
    end
  end

end