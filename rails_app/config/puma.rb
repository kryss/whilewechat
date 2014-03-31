rails_env = ENV['RAILS_ENV'] || 'development'

threads 4,4

bind  "unix:///var/run/whilewechat.sock"
pidfile "/srv/www/w42.itsium.cn/rails_app/tmp/puma.pid"
state_path "/srv/www/w42.itsium.cn/rails_app/tmp/puma.state"

activate_control_app

