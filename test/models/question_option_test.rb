require 'test_helper'

class QuestionOptionTest < ActiveSupport::TestCase
  def setup
    @question = questions(:one)
  end

  test 'valid question option' do
    question_option = QuestionOption.create(question_id: @question.id, body: 'This is a test question option', personlity_type: "Introvert")
    assert question_option.valid?
  end

  test 'invalid user without body' do
    question_option = QuestionOption.create(body: 'This is a test question option')
    assert_not question_option.valid?
  end
end
