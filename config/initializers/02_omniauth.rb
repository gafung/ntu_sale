Rails.application.config.middleware.use OmniAuth::Builder do
#  provider :facebook, FACEBOOK_CONFIG['app_id'], FACEBOOK_CONFIG['secret'], {:scope => 'user_about_me'}
# provider :facebook, FACEBOOK_CONFIG['app_id'], FACEBOOK_CONFIG['secret'], {:scope => 'user_friends,user_about_me'}
  provider :facebook, '1430225577271122', '6a1659bda82e1ae0cb16705808e72ae1', {:scope => 'user_friends,user_about_me'}
end
