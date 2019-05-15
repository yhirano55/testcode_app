require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "#create" do
    user = User.create(email: 'admin@example.com', password: 'password')
    assert user.persisted?
  end

  test "#ban!" do
    user = User.create(email: 'admin@example.com', password: 'password', banned: false)
    assert !user.banned?

    user.ban!
    assert user.banned?
  end

  test "#unban!" do
    user = User.create(email: 'admin@example.com', password: 'password', banned: true)
    assert user.banned?

    user.unban!
    assert !user.banned?
  end

  test "#access_token" do
    user = User.create(email: 'admin@example.com', password: 'password')
    assert_kind_of String, user.access_token
  end
end
