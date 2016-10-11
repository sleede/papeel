class User < ActiveRecord::Base
  include Papeel::ActsAsPapeelUser
  acts_as_papeel_user
end
