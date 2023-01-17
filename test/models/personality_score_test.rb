require 'test_helper'

class PersonalityScoreTest < ActiveSupport::TestCase
  def setup
    @user = User.create(email: 'test@example.com', password: "123456")
  end

  test 'valid question option' do
    question_option = PersonalityScore.create(user_id: @user.id, introvert_score: 1)
    assert question_option.valid?
  end

  test 'invalid user without body' do
    question_option = PersonalityScore.create(introvert_score: 1)
    assert_not question_option.valid?
  end
end
