class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :personality_scores, dependent: :destroy

  enum role: { user: 0, admin: 1 } 

  def check_personality
    introvert_score = self.personality_scores.map(&:introvert_score).sum
    extrovert_score = self.personality_scores.map(&:extrovert_score).sum

    introvert_score > extrovert_score ? "introvert" : "extrovert"
  end
end
