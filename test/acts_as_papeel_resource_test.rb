require 'test_helper'

class ActsAsPapeelResourceTest < ActiveSupport::TestCase
  setup do
  end

  test "respond to methods" do
    assert_respond_to Forum.new, :roles_as_resource
  end
end
