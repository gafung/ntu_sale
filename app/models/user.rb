class User < ActiveRecord::Base
  def self.koala(auth)
    access_token = auth['token']
    facebook = Koala::Facebook::API.new(access_token)
    facebook.get_object("me?fields=name,picture")
  end

  def self.fds(auth)
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
#  name       :string
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

