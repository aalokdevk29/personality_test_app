class PersonalityTestsController < ApplicationController
  def test
    @questions = Question.all.sample(5).shuffle
  end

  def question_attempt
    option = QuestionOption.find(params[:option_id])
    introvert_score = option.personlity_type == "Extrovert" ? 1 : 0
    extrovert_score = option.personlity_type == "Introvert" ? 1 : 0

    PersonalityScore.create(user_id: current_user.id, introvert_score: introvert_score, extrovert_score: extrovert_score)
  end
end
