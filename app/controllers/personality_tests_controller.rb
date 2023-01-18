class PersonalityTestsController < ApplicationController
  def test
    personality_score = current_user.personality_score

    if personality_score.present?
      @question = Question.where.not(id: personality_score.attempted_question_ids).shuffle.sample
      @qeuestion_no = personality_score.attempted_question_ids.count + 1
    else
      @question = Question.all.shuffle.sample
      @qeuestion_no = 1
    end

  end

  def question_attempt
    personality_score = PersonalityScore.find_or_create_by(user_id: current_user.id)
    question = Question.where.not(id: personality_score.attempted_question_ids + [params[:question_id].to_i]).shuffle.sample
    option = QuestionOption.find(params[:option_id])

    introvert_score = option.personlity_type == "Extrovert" ? 1 : 0
    extrovert_score = option.personlity_type == "Introvert" ? 1 : 0

    personality_score.introvert_score = personality_score.introvert_score.to_i + introvert_score
    personality_score.extrovert_score = personality_score.extrovert_score.to_i + extrovert_score
    personality_score.attempted_question_ids << params[:question_id].to_i
    personality_score.save
    attempted_questions = personality_score.attempted_question_ids.count

    if attempted_questions >= 5
      render partial: 'result_page'
    else
      render partial: 'question', locals: {question: question, qeuestion_no: attempted_questions + 1}
    end
  end
end
