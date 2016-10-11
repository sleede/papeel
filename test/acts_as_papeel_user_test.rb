require 'test_helper'

class ActsAsPapeelUserTest < ActiveSupport::TestCase
  setup do
    @user = User.create!
    @forum = Forum.create!
    Papeel::Role.create! user: @user, name: :super_admin
    Papeel::Role.create! user: @user, name: :admin, resource: @forum
  end

  test "respond to roles" do
    assert_respond_to @user, :roles
  end

  test "respond to generated scopes" do
    assert_respond_to User, :super_admin
    assert_respond_to User, :admin
  end

  test "respond to generated instance methods" do
    assert_respond_to @user, :is_admin?
    assert_respond_to @user, :is_super_admin?
  end

  test "has_role? method" do
    assert @user.has_role? :super_admin
    refute @user.has_role? :super_admin, any: true
    refute @user.has_role? :admin

    assert @user.has_role? :admin, on: @forum
    assert @user.has_role? :admin, on_type: 'Forum', on_id: @forum.id
    assert @user.has_role? :admin, any: true
  end
end
