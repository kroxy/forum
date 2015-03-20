Rails.application.config.middleware.use OmniAuth::Builder do
  # The following is for facebook
  provider :facebook, "622581664543484", "4bfdc2d4e18c6de0c96ddafc496bb565", {:scope => 'email'}

  # If you want to also configure for additional login services, they would be configured here.
end