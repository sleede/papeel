require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  test "respond_to class methods" do
    assert_respond_to Papeel::Role, :named
    assert_respond_to Papeel::Role, :on
  end

  test "respond_to instance methods" do
    role = Papeel::Role.new

    assert_respond_to role, :user
    assert_respond_to role, :resource
    assert_respond_to role, :name
  end

  test "validations" do
    role = Papeel::Role.new

    refute role.valid?

    assert role.errors.key?(:name)
    assert role.errors.key?(:user)

    user = User.new
    role.user = user

    refute role.valid?

    refute role.errors.key?(:user)

    role.name = "invalid_role_name"

    refute role.valid?

    role.name = "admin"

    assert role.valid?

    user.save!
    role.save!

    refute Papeel::Role.new(user: user, name: "admin").valid?

    forum = Forum.create!
    role = Papeel::Role.new(user: user, name: "admin", resource: forum)

    assert role.valid?

    role.save!

    refute Papeel::Role.new(user: user, name: "admin", resource: forum).valid?
  end
end
