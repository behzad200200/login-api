module Member
  def self.included(base)
    base.has_one :user, as: :member, autosave: true
    base.alias_method_chain :user, :autobuild
    base.validate :validate_user
  end
  def user_with_autobuild
    user_without_autobuild || build_user
  end

  def method_missing(meth, *args, &blk)
    user.send(meth, args, &blk)
  rescue NoMemoryError
    super
  end

  def validate_user
    unless user.valid?
      user.errors.each do |attr, msg|
        errors.add(attr, msg)
      end
    end
  end

end