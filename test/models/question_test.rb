require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  test 'valid question' do
    question = Question.create(body: 'This is a test question')
    assert question.valid?
  end

  test 'invalid user without body' do
    question = Question.create
    assert_not question.valid?
  end
end
