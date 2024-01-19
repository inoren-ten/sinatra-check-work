require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection

class Posts < ActiveRecord::Base
end
