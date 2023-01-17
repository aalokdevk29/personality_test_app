class Question < ApplicationRecord
  has_many :question_options, dependent: :destroy

  validates :body, presence: true
  accepts_nested_attributes_for :question_options, allow_destroy: true
end
