class CreatePersonalityScores < ActiveRecord::Migration[5.2]
  def change
    create_table :personality_scores do |t|
      t.references :user, foreign_key: true
      t.integer :introvert_score
      t.integer :extrovert_score

      t.timestamps
    end
  end
end
