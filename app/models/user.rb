class User < ActiveRecord::Base
  has_many :tweets
  has_secure_password
  validates_presence_of :username, :email, :password

  def slug
    self.username.downcase.split(" ").join("-")
  end

  def self.find_by_slug(object)
    User.all.find {|i| i.slug == object}
  end

end
