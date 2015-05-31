class User < ActiveRecord::Base

  validates :fb_id, uniqueness: true

  def self.basic_info_from_fb(auth)
    access_token = auth['token']
    facebook = Koala::Facebook::API.new(access_token)
    facebook.get_object("me?fields=name,picture")
  end

  def self.friends_from_fb(auth)
    access_token = auth['token']
    facebook = Koala::Facebook::API.new(access_token)
    facebook.get_connections("me", "friends")
  end
end


# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  fb_id      :string
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  name       :string
#

