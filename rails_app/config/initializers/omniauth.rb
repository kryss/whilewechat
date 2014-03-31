Rails.application.config.middleware.use OmniAuth::Builder do
  provider :wechat, 'wx7c35f10103e31584', 'da3cd9ba13eaf82a1dfd9ed83d6664bc'
end


#https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx7c35f10103e31584
#&redirect_uri=http%3A%2F%2F10.0.1.26%3A3000%2Fauth%2Fwechat%2Fcallback
#&response_type=code&scope=snsapi_userinfo
#&state=d1a51f02f41b167f875385866c76bcabb1de12447e921a1b#wechat_redirect
