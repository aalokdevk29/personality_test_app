class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :personality_score, dependent: :destroy

  enum role: { user: 0, admin: 1 } 

  def check_personality
    introvert_score = self.personality_score.introvert_score
    extrovert_score = self.personality_score.extrovert_score

    introvert_score > extrovert_score ? "introvert" : "extrovert"
  end

  def admin?
    self.role == "admin"
  end
end
