require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'valid user' do
    user = User.create(email: 'test@example.com', password: "123456")
    assert user.valid?
  end

  test 'invalid user without password' do
    user = User.create(email: 'test@example.com')
    assert_not user.valid?
  end

  test "check_personality" do
    user = users :one
    assert_equal user.check_personality, "extrovert"
  end
end
