Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "893599840678247", "84e6653f9c8a41cce0559c30dae82df5", { :scope => 'user_location, user_birthday, user_about_me, email'}
end

