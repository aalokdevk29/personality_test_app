class AddAttemptedQuestionIdsToPersonalityScores < ActiveRecord::Migration[5.2]
  def change
    add_column :personality_scores, :attempted_question_ids, :integer, default: [], array: true
  end
end
