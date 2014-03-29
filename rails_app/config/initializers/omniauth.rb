Rails.application.config.middleware.use OmniAuth::Builder do
  provider :wechat, 'wx7c35f10103e31584', 'da3cd9ba13eaf82a1dfd9ed83d6664bc'
end
