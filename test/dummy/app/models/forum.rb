class Forum < ActiveRecord::Base
  include Papeel::ActsAsPapeelResource
  acts_as_papeel_resource
end
