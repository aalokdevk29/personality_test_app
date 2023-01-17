class QuestionOption < ApplicationRecord
  belongs_to :question
  validates :body, :personlity_type, presence: true
end
